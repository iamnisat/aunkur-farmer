import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/app_asset.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/app_constant.dart';
import 'package:aunkur_farmer/src/common/widget/app_constant_ui.dart';
import 'package:aunkur_farmer/src/common/widget/helper.dart';
import 'package:aunkur_farmer/src/feature/crop/data/model/pesticide_model.dart';
import 'package:aunkur_farmer/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PesticideList extends StatelessWidget {
  final List<PesticideModel> pesticides;
  final int cropId;

  const PesticideList({super.key, required this.pesticides, required this.cropId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: pesticides.isEmpty? Center(
        child: AppHelper.emptyView(),
      ): ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: pesticides.length,
        itemBuilder: (BuildContext context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/PesticideAndDisease',arguments: {
                'pesticideName': pesticides[index].diseaseName,
                'cropId': cropId,
                'pesticideId': pesticides[index].id,
              });
            },
            child: Container(
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.borderColor, width: 1),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset(AppAssets.tileLeaf),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius:
                              SizeConfig.orientation == Orientation.landscape
                              ? (SizeConfig.screenWidth +
                                        SizeConfig.screenHeight) *
                                    0.04
                              : (SizeConfig.screenWidth +
                                        SizeConfig.screenHeight) *
                                    0.03,
                          backgroundColor: AppColors.primaryYallow,
                          child: AppConstantUI.buildImage(
                            "${AppConstant.S_3_BUCKET_FOLDER_PESTICIDES}${pesticides[index].images.isNotEmpty ? pesticides[index].images[0].image : ""}",
                            70,
                            Colors.grey.shade300,
                            2,
                            () {},
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pesticides[index].diseaseName,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryYallow
                                          .withOpacity(0.1),

                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                      AppAssets.cropDisease,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Flexible(
                                    child: Text(
                                      "${S.of(context).diseaseType} : ${pesticides[index].diseaseType}",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelMedium,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "${S.of(context).priority}: ${pesticides[index].priority}",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 10),
      ),
    );
  }
}
