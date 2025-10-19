import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/utils/shimmer/shimmer_effact.dart';
import 'package:aunkur_farmer/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class CropCardShimmer extends StatelessWidget {
  const CropCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final avatarRadius = SizeConfig.orientation == Orientation.landscape
        ? (SizeConfig.screenWidth + SizeConfig.screenHeight) * 0.03
        : (SizeConfig.screenWidth + SizeConfig.screenHeight) * 0.02;

    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.borderColor, width: 1),
              ),
              child: Row(
                children: [
                  // Avatar placeholder
                  Container(
                    height: avatarRadius * 2,
                    width: avatarRadius * 2,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black12,
                    ),
                  ),
                  const SizedBox(width: 10),
      
                  // Text placeholders
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Crop name line
                        Container(
                          height: 14,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 8),
      
                        // Family row
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Container(height: 12, color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
      
                        // Scientific name row
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Container(height: 12, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => 6.heightBox,
        itemCount: 10,
      ),
    );
  }
}
