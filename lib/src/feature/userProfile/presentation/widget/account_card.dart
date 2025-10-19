import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountCard extends StatelessWidget {
  final String leadingIconSvg;
  final String title;
  final String description;
  final int index;
  final void Function()? onTap;
  const AccountCard(
      {super.key,
      required this.leadingIconSvg,
      required this.title,
      this.description = "",
      required this.index,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        // side: const BorderSide(color: AppColors.primaryGray, width: 2),
      ),
      onTap: onTap,
      dense: true,
      visualDensity: const VisualDensity(vertical: -4),
      contentPadding: const EdgeInsets.symmetric(horizontal: 2),
      leading: Container(
        padding: const EdgeInsets.all(7),
        decoration: const BoxDecoration(
            color: AppColors.primaryGray, shape: BoxShape.circle),
        child: SvgPicture.asset(leadingIconSvg,
            width: 28,
            height: 28,
            colorFilter: const ColorFilter.mode(
                AppColors.primaryBlack, BlendMode.srcIn)),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: description.isNotEmpty
          ? Text(
              description,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: AppColors.secondaryDark),
            )
          : null,
      trailing: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.primaryGray,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Icon(
          Icons.arrow_forward_ios_outlined,
          color: AppColors.primaryBlack,
          size: 15,
        ),
      ),
    );
  }
}
