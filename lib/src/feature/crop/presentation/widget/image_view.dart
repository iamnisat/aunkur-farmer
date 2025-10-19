import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/app_constant.dart';
import 'package:aunkur_farmer/src/feature/crop/data/model/pesticide_details_model.dart';
import 'package:flutter/material.dart';

class ImageViewWithZoom extends StatefulWidget {
  final List<PesticideImages> imageUrl;
  final int initialPage;
  const ImageViewWithZoom({
    super.key,
    required this.imageUrl,
    required this.initialPage,
  });

  @override
  State<ImageViewWithZoom> createState() => _ImageViewWithZoomState();
}

class _ImageViewWithZoomState extends State<ImageViewWithZoom> {
  late PageController _pageController;
  int activePage = 1;
  @override
  void initState() {
    activePage = widget.initialPage;
    _pageController = PageController(initialPage: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryBlack,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryWhite),
        ),
      ),
      backgroundColor: AppColors.primaryBlack,
      body: InteractiveViewer(
        maxScale: 10,
        child: PageView.builder(
          itemCount: widget.imageUrl.length,
          pageSnapping: true,
          controller: _pageController,
          onPageChanged: (page) {
            setState(() {
              activePage = page;
            });
          },
          itemBuilder: (context, pagePosition) {
            return Center(
              child: Image.network(
                "${AppConstant.S_3_BUCKET_FOLDER_PESTICIDES}${widget.imageUrl[pagePosition].image}",
                loadingBuilder:
                    (
                      BuildContext context,
                      Widget child,
                      ImageChunkEvent? loadingProgress,
                    ) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: LinearProgressIndicator(
                          backgroundColor: AppColors.primaryYallow,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                              : null,
                          color: AppColors.primaryYallow,
                        ),
                      );
                    },
              ),
            );
          },
        ),
      ),
    );
  }
}
