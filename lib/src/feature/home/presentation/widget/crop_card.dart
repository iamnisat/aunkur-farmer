import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/app_asset.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/app_constant.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/common/widget/app_constant_ui.dart';
import 'package:aunkur_farmer/src/feature/crop/data/model/crop_model.dart';
import 'package:aunkur_farmer/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CropCard extends StatelessWidget {
  final Function()? onTap;
  final CropModel model;
  const CropCard({super.key, this.onTap, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
              top: 5,
              right: 5,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_forward, size: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: SizeConfig.orientation == Orientation.landscape
                        ? (SizeConfig.screenWidth + SizeConfig.screenHeight) *
                              0.03
                        : (SizeConfig.screenWidth + SizeConfig.screenHeight) *
                              0.02,
                    backgroundColor: AppColors.primary,
                    child: AppConstantUI.buildImage(
                      "${AppConstant.S3_BUCKET_FOLDER_CROP}${model.image}",
                      60,
                      Colors.grey.shade300,
                      2,
                      () {},
                    ),
                  ),
                  10.widthBox,
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${model.cropName} (${model.cropBanglaName})",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: AppColors.primaryYallow.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                AppAssets.cropFamily,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                "${S.of(context).family} : ${model.cropFamily}",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: AppColors.primaryYallow.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                AppAssets.cropScience,
                                color: AppColors.primary,
                              ),
                            ),
                            6.widthBox,
                            Flexible(
                              child: Text(
                                "${S.of(context).scientificName} : ${model.scientificName}",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ),
                          ],
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
  }
}
