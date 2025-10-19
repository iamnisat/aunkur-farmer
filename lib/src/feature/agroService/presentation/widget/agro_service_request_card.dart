import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/app_asset.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/enum.dart';
import 'package:aunkur_farmer/src/common/function/common_function.dart';
import 'package:aunkur_farmer/src/common/widget/app_constant_ui.dart';
import 'package:aunkur_farmer/src/feature/chat/data/model/conversation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AgroServiceRequestCard extends StatelessWidget {
  final ConversationModel model;
  final Function()? onTap;
  const AgroServiceRequestCard({super.key, required this.model, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryWhite,
          borderRadius: BorderRadius.circular(6),
      
          border: Border.all(color: AppColors.borderColor, width: 1),
        ),
        child: Column(
          children: [
            Container(
              color: AppColors.borderColor.withValues(alpha: 0.5),
              padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 6),
              child: Row(
                spacing: 5,
                children: [
                  SvgPicture.asset(
                    AppAssets.crop,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                    height: 16,
                  ),
                  Text(
                    model.thread.crop,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(
                  //     vertical: 4,
                  //     horizontal: 6,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     color: CommonFunction.getRequestStatusColorById(index),
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(6),
                  //       topRight: Radius.circular(5),
                  //     ),
                  //   ),
                  //   child: Text(
                  //     CommonFunction.getRequestStatusById(index),
                  //     style: Theme.of(
                  //       context,
                  //     ).textTheme.labelSmall?.copyWith(color: AppColors.primaryWhite,fontWeight: FontWeight.bold),
                  //   ),
                  // ),
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
                          title: S.of(context).year,
                          discription: CommonFunction.convertNumEnToBn(model.thread.year),
                        ),
                        const SizedBox(height: 10),
                        TitleAndDiscriptionCard(
                          title: S.of(context).season,
                          discription: CommonFunction.getSeasonNameById(
                            model.thread.seasonId,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16), // consistent spacing between columns
                  // Right column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleAndDiscriptionCard(
                          title: S.current.landAmount,
                          discription: "${CommonFunction.convertNumEnToBn(model.thread.land)} ${S.current.shotok}",
                        ),
                        const SizedBox(height: 10),
                        TitleAndDiscriptionCard(
                          title: S.current.requestType,
                          discription: AdvisoryTypeExtension.fromString(
                            model.thread.type,
                          ).displayName,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Button For Redirect To Chat
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
              ),
              child: TextButton.icon(
                onPressed: onTap,
                label: Text(
                  "View Conversation",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                icon: const Icon(
                  Icons.chat_bubble_outline,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
