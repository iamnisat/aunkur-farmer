import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCloseButtom extends StatelessWidget {
  final void Function()? onTap;
  const CustomCloseButtom({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ??
          () {
            Navigator.of(context).pop();
          },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.borderColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.close,
          size: 17,
        ),
      ),
    );
  }
}
