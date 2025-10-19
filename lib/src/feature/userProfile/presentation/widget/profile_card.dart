import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/common/function/common_function.dart';
import 'package:aunkur_farmer/src/common/widget/app_constant_ui.dart';
import 'package:aunkur_farmer/src/feature/authentication/data/user_model.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final UserModel user;
  const ProfileCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.borderColor, width: 1),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: 30,
                child: Text(
                  CommonFunction.extractInitials(user.name),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.lowWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // AppConstantUI.networkImageBuild(
              //   url: "",
              //   size: 30,
              //   borderColor: AppColors.primary,
              //   borderRadius: 30,
              //   borderWidth: 1,
              // ),
              12.widthBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 12),
                  Text(
                    user.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  textLineGap.heightBox,
                  Text(
                    user.mobile,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  textLineGap.heightBox,

                  Text(
                    user.village,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
        16.heightBox,
        Container(
          // padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.circular(6),

            border: Border.all(color: AppColors.borderColor, width: 1),
          ),
          child: Column(
            children: [
              Container(
                color: AppColors.borderColor.withValues(alpha: 0.5),
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  spacing: 5,
                  children: [
                    Icon(Icons.location_on_outlined, color: AppColors.primary),
                    Text(
                      S.current.addressInformation,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleAndDiscriptionCard(
                            title: S.of(context).division,
                            discription: user.divisionName,
                          ),
                          const SizedBox(height: 10),
                          TitleAndDiscriptionCard(
                            title: S.of(context).district,
                            discription: user.districtName,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ), // consistent spacing between columns
                    // Right column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleAndDiscriptionCard(
                            title: S.of(context).upazila,
                            discription: user.upazillaName,
                          ),
                          const SizedBox(height: 10),
                          TitleAndDiscriptionCard(
                            title: S.of(context).union,
                            discription: user.unionName,
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
      ],
    );
  }
}
