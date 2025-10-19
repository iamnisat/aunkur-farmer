import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/function/common_function.dart';
import 'package:aunkur_farmer/src/common/widget/app_constant_ui.dart';
import 'package:aunkur_farmer/src/feature/notification/data/notification_model.dart';
import 'package:aunkur_farmer/src/feature/notification/repositories/notification_repo.dart';
import 'package:aunkur_farmer/src/utils/read_more_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationCard extends StatelessWidget {
  final List<NotificationModel> model;
  final String date;
  const NotificationCard({super.key, required this.model, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: const Color(0XFFE5E4DF),
          elevation: 0,
          margin: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              date,
              style: const TextStyle(
                color: Color(0XFF7F7B70),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              background: Container(
                padding: const EdgeInsets.only(right: 16),
                alignment: Alignment.centerRight,
                color: AppColors.rejected,
                child: const Icon(
                  FontAwesomeIcons.trashCan,
                  color: AppColors.primaryWhite,
                ),
              ),
              onDismissed: (direction) {
                NotificationRepo.instance.deleteNotification(model[index].id);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryWhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    if (model[index].imageUrl.isNotEmpty) ...[
                      AppConstantUI.networkImageBuild(
                        url: model[index].imageUrl,
                        size: 40,
                        borderRadius: 25,
                      ),
                    ],
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  model[index].title,
                                  maxLines: 1,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                              ),
                              Text(
                                CommonFunction.millisToTime(
                                  model[index].createdAt,
                                ),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          ReadMoreText(
                            model[index].body,
                            style: Theme.of(context).textTheme.bodyMedium,
                            moreStyle: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  color: AppColors.primaryYallow,
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                            lessStyle: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  color: AppColors.primaryYallow,
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                            trimLines: 5,
                            colorClickableText: AppColors.primaryYallow,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: ' Show more',
                            trimExpandedText: '\nShow less',
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 5);
          },
          itemCount: model.length,
        ),
      ],
    );
  }
}
