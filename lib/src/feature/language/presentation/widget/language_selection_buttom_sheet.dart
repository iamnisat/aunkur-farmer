
import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/app_asset.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/common/widget/custom_close_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future<bool?> languageSelectionButtonSheet(
    BuildContext context, Function(String) onLanguageChange,String currentLanguage) {
  return showModalBottomSheet<bool?>(
    context: context,
    isDismissible: true,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    showDragHandle: false,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
          return SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom /*  */ + 240,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize:
                    MainAxisSize.min, // Adapts to the content dynamically.
                children: [
                  // Header Row with Title and Filter Options
                  Row(
                    children: [
                      Text(S.current.selectYourLanguage,
                          style: Theme.of(context).textTheme.headlineSmall),

                      const Spacer(),
                      const CustomCloseButtom(), // Close button for the modal.
                    ],
                  ),

                  const SizedBox(height: textfieldgap),

                  Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  color: AppColors.primaryGray, width: 2),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              onLanguageChange(languageList[index].code);
                            },
                            visualDensity: const VisualDensity(vertical: -4),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 7),
                            leading: Container(
                              padding: const EdgeInsets.all(7),
                              decoration: const BoxDecoration(
                                  color: AppColors.primaryGray,
                                  shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                AppAssets.countryFlagList[index],
                                width: 28,
                                height: 28,
                              ),
                            ),
                            title: RichText(
                              text: TextSpan(
                                text: languageList[index].country,
                                style: Theme.of(context).textTheme.bodyLarge,
                                children: [
                                  TextSpan(
                                    text: " (${languageList[index].name})",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                            color: AppColors.secondaryDark),
                                  ),
                                ],
                              ),
                            ),
                            trailing: Icon(
                              currentLanguage == languageList[index].code
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              color: AppColors.primary,
                              size: 20,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: languageList.length),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
