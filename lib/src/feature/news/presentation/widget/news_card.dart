import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/common/widget/app_constant_ui.dart';
import 'package:aunkur_farmer/src/utils/size_config.dart';
import 'package:flutter/material.dart';

const List<String> topics = [
  'Agriculture',
  'Farm',
  'IoT',
  'AI',
  // 'Smart Farming',
  // 'Organic',
  // 'BigData',
  // 'Sensors',
];

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),

        border: Border.all(color: AppColors.borderColor, width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Text("Md. Shihab Sadik",
                        style: Theme.of(context).textTheme.labelLarge),
                    Text(
                      "Today, 10:00 AM",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                Text(
                  'Focusing on Signal, Not Noise: How We Use Data Smarter in Agritech',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Working in agritech means dealing with complexity—every single day. From farmers and weather data to soil tests, credit profiles, vendor logistics, partner updates, and more, we’re swimming in information. And if we’re honest, the temptation is always there to just collect everything and hope that the insights will somehow emerge on their own.',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 8.0),
                // Add Multipel Tags
                Wrap(
                  spacing: 6.0,
                  runSpacing: 6.0,
                  children: List.generate(
                    topics.length,
                    (index) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 2.0,
                      ),
                      decoration: BoxDecoration(
                        color:
                            AppColors.profilePageColor[index %
                                AppColors.profilePageColor.length],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Text(
                        topics[index],
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          10.widthBox,
          AppConstantUI.networkImageBuild(
            url:
                "https://aunkur.ai/_next/image?url=https%3A%2F%2Flh3.googleusercontent.com%2Fd%2F131Dv_ctmC6k6bOIV-m1QT6nzA01i7uLo&w=828&q=75",
            onTap: () {},
            size: 100,
          ),
        ],
      ),
    );
  }
}
