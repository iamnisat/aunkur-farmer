import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/app_constant.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/common/widget/app_constant_ui.dart';
import 'package:aunkur_farmer/src/feature/crop/bloc/crop_bloc.dart';
import 'package:aunkur_farmer/src/feature/crop/presentation/widget/chemical_management.dart';
import 'package:aunkur_farmer/src/feature/crop/presentation/widget/image_view.dart';
import 'package:aunkur_farmer/src/feature/crop/repositories/crop_repo.dart';
import 'package:aunkur_farmer/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class PesticideAndDisease extends StatefulWidget {
  final String pesticideName;
  final int cropId;
  final int pesticideId;
  const PesticideAndDisease({
    super.key,
    required this.pesticideName,
    required this.cropId,
    required this.pesticideId,
  });

  @override
  State<PesticideAndDisease> createState() => _PesticideAndDiseaseState();
}

class _PesticideAndDiseaseState extends State<PesticideAndDisease> {
  late PageController pageController;
  int activePage = 1;
  Map<int, String> units = {};

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 1, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).pestAndDisease)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(scaffoldDefaultPadding),
          child: BlocProvider(
            create: (context) => CropBloc(context.read<CropRepo>())
              ..add(
                PesticideAndDiseaseRequestEvent(
                  widget.pesticideId,
                  widget.cropId,
                ),
              ),

            child: BlocBuilder<CropBloc, CropState>(
              builder: (context, state) {
                if (state is CropLoading) {
                  return Center(child: loadingPageWidget());
                } else if (state is CropError) {
                  return errorPageWidget(
                    title: S.current.errorOccurred,
                    description:state.message);
                } else if (state is PesticideAndDiseaseLoaded) {
                  final model = state.pesticideDetails;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: PageView.builder(
                          itemCount: model.image.length,
                          pageSnapping: true,
                          controller: pageController,
                          onPageChanged: (page) {
                            setState(() {
                              activePage = page;
                            });
                          },
                          itemBuilder: (context, pagePosition) {
                            return Container(
                              margin: const EdgeInsets.all(10),
                              child: Stack(
                                children: [
                                  AppConstantUI.buildImage(
                                    "${AppConstant.S_3_BUCKET_FOLDER_PESTICIDES}${model.image[pagePosition].image}",
                                    double.infinity,
                                    AppColors.primaryWhite,
                                    2,
                                    () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: ((context) =>
                                              ImageViewWithZoom(
                                                  imageUrl: model.image,
                                                initialPage: activePage,
                                              )),
                                        ),
                                      );
                                    },
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: ((context) =>
                                                ImageViewWithZoom(
                                                  imageUrl: model.image,
                                                  initialPage: activePage,
                                                )),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.zoom_in,
                                        color: AppColors.primaryWhite,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: indicators(model.image.length, activePage),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  S.of(context).diseaseName,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                Text(
                                  S.of(context).diseaseType,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    model.diseaseName,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    model.diseaseType,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).natureOfDamage,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                      Html(
                        data: model.damageControl,
                        style: {"p": Style(textAlign: TextAlign.justify)},
                      ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Text(
                          S.of(context).controlMeasure,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Html(
                        data: model.controlMeasure,
                        style: {"p": Style(textAlign: TextAlign.justify)},
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 10,
                        ),
                        child: Text(
                          S.of(context).chemicalManagement,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: model.chemical.length,
                        itemBuilder: (BuildContext context, index) {
                          return ChemicalManagement(
                            chemical: model.chemical[index],
                            pesticideName: widget.pesticideName,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            6.heightBox,
                      ),
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
