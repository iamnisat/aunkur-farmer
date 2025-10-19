import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/widget/app_constant_ui.dart';
import 'package:aunkur_farmer/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopInfoCard extends StatelessWidget {
  final String title;
  final String iconSvg;
  final Function()? onTap;
  final int index;
  const TopInfoCard({
    super.key,
    required this.title,
    required this.iconSvg,
    this.onTap,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        // height: SizeConfig.orientation == Orientation.landscape
        //     ? (SizeConfig.screenWidth + SizeConfig.screenHeight) * 0.1
        //     : (SizeConfig.screenWidth + SizeConfig.screenHeight) * 0.08,
        // width: SizeConfig.orientation == Orientation.landscape
        //     ? (SizeConfig.screenWidth + SizeConfig.screenHeight) * 0.2
        //     : (SizeConfig.screenWidth + SizeConfig.screenHeight) * 0.3,
        decoration: BoxDecoration(
          color: AppColors.profilePageColor[index],
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 0), // shadow on all sides
            ),
          ],
          // border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Stack(
          children: [
            // 🔼 Arrow (Top Right)
            Positioned(
              right: 4,
              top: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(
                  Icons.north_east,
                  size: 10,
                  color: AppColors.primary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    iconSvg,
                    height: 18,
                    width: 18,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),

                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
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
