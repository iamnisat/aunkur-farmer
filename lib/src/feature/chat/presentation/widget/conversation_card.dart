import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/common/function/common_function.dart';
import 'package:aunkur_farmer/src/feature/chat/data/model/conversation_model.dart';
import 'package:aunkur_farmer/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class ConversationCard extends StatelessWidget {
  final Function()? onTap;
  final ConversationModel model;
  const ConversationCard({super.key, this.onTap, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeConfig.screenWidth,
        padding: const EdgeInsets.all(8),
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(8),
        //   border: Border.all(color: AppColors.borderColor, width: 1),
        // ),
        child: Row(
          children: [
            CircleAvatar(
              radius: SizeConfig.orientation == Orientation.landscape
                  ? (SizeConfig.screenWidth + SizeConfig.screenHeight) * 0.03
                  : (SizeConfig.screenWidth + SizeConfig.screenHeight) * 0.02,
              backgroundColor: AppColors.primary,
              child: Text(
                CommonFunction.extractInitials(model.convName),
                style: TextStyle(color: Colors.white),
              ),
            ),
            10.widthBox,
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.convName,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    model.lastMessage,
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium?.copyWith(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                CommonFunction.formatChatTimestamp(model.lastDateTime),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
