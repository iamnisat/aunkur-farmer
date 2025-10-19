import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

class LanguageSelectCart extends StatelessWidget {
  final int index;
  final void Function()? onTap;
  final String title;
  final int selectedIndex;
  const LanguageSelectCart({
    super.key,
    required this.index,
    required this.title,
    this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primaryWhite,
          border: Border.all(
            color: index == selectedIndex
                ? AppColors.primary
                : AppColors.borderColor,
          ),
        ),
        child: Row(
          children: [
            // SvgPicture.asset(
            //   AppAsset.flagIconItem[index],
            //   width: 27,
            //   height: 27,
            // ),
            // const SizedBox(
            //   width: textfieldgap,
            // ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Icon(
                        selectedIndex == index
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        size: 22,
                        color: AppColors.primary,
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
  }
}
