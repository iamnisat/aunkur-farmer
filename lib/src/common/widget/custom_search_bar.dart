import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/app_asset.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchBar extends StatelessWidget {
  final String? hintText;
  final FocusNode? focusNode;
  final TextEditingController controller;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;
  final Function()? onTapSuffixIcon;
  const CustomSearchBar({
    super.key,
    required this.onChanged,
    this.hintText,
    this.focusNode,
    required this.controller,
    this.onTapSuffixIcon,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: AppColors.borderColor,
            blurRadius: 20,
            offset: Offset(0, 12),
            spreadRadius: 16,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 19, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.go,
                focusNode: focusNode,
                controller: controller,
                
                onSubmitted: (value) {},
                decoration: InputDecoration(
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none ,
                  hintText:
                      hintText ?? S.of(context).searchHere, //'Search Here',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  suffixIcon: InkWell(
                    onTap: onTapSuffixIcon,
                    splashColor: AppColors.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: controller.text.isEmpty?  SvgPicture.asset(AppAssets.searchIconSvg,
                      width: 17, height: 17): Icon(Icons.close, size: 17, color: Colors.grey),
                    ),
                  ),
                  
                ),
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
