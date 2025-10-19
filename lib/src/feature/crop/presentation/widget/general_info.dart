import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/feature/crop/data/model/crop_details_model.dart';
import 'package:aunkur_farmer/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class CropGeneralInfo {
  BuildContext context;
  CropGeneralInfo({required this.context});
  Widget cropGenealInfoView(CropDetailsModel crop) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              S.of(context).cropInfo,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Divider(
              thickness: 2,
              color: AppColors.primaryBlack.withOpacity(0.10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: cropInfoView(context, crop),
          ),
          // soil and climate information
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              S.of(context).soilAndClimateInfo,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Divider(
              thickness: 2,
              color: AppColors.primaryBlack.withOpacity(0.10),
            ),
          ),
          climateView(context, crop.climate),
          // seed information
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              S.of(context).seedInformation,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Divider(
              thickness: 2,
              color: AppColors.primaryBlack.withOpacity(0.10),
            ),
          ),
          viewSeedInfo(context, crop.seed),
          viewLanFartiIrrigationInfo(context, crop),
        ],
      ),
    );
  }
}

Widget cropInfoView(BuildContext context, CropDetailsModel model) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 2,
          children: [
            Text(
              S.of(context).cropName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "${model.cropName} (${model.cropBanglaName})",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              S.of(context).family,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              model.cropFamily,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              S.of(context).averageProduction,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "${model.averageProduction}",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          spacing: 2,
          children: [
            Text(
              S.of(context).cropCategory,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              model.cropCategory.categoryName,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              S.of(context).scientificName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              model.scientificName,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget climateView(BuildContext context, Climate model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                spacing: 2,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).soilPh,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "${model.climatePhStart} - ${model.climatePhEnd} ${S.current.pH}",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    S.of(context).climateTemperature,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "${model.climateTemperatureStart} - ${model.climateTemperatureEnd} \u00b0C",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    S.of(context).climateHumidity,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "${model.climateHumidity} - ${model.climateHumidityEnd} %",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    S.of(context).soilTexture,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    getSoilTextureById(model.soilTexture ?? 0),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                spacing: 2,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    S.of(context).landType,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    getLandTypeById(model.landType ?? 0),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    S.of(context).climateRainfall,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "${model.climateRainfallStart} - ${model.climateRainfallEnd} (mm)",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    S.of(context).salinity,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "${model.salinityStart} - ${model.salinityEnd} %",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Text(
          S.of(context).climateGenInfo,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      Html(
        data: model.generalInfo,
        style: {
          "p": Style(
            padding: HtmlPaddings.symmetric(horizontal: 7),
            textAlign: TextAlign.justify,
          ),
        },
      ),
    ],
  );
}

Widget viewSeedInfo(BuildContext context, Seed model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Text(
          S.of(context).seedRate,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Text(
          model.seedRate,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Text(
          S.of(context).seedTreatment,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      Html(
        data: model.treatment,
        style: {
          "p": Style(
            padding: HtmlPaddings.symmetric(horizontal: 7),
            textAlign: TextAlign.justify,
          ),
        },
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Text(
          S.of(context).sowingMethod,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      Html(
        data: model.showingMethod,
        style: {
          "p": Style(
            padding: HtmlPaddings.symmetric(horizontal: 7),
            textAlign: TextAlign.justify,
          ),
        },
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Text(
          S.of(context).seedbed,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      Html(
        data: model.seedbed,
        style: {
          "p": Style(
            padding: HtmlPaddings.symmetric(horizontal: 7),
            textAlign: TextAlign.justify,
          ),
        },
      ),
    ],
  );
}

Widget viewLanFartiIrrigationInfo(
  BuildContext context,
  CropDetailsModel model,
) {
  final irrigation = model.irrigation;
  final fertilizer = model.fertilizer;
  final intercultural = model.intercultural;
  final harvesting = model.harvest;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Text(
          S.of(context).lanPreparation,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Divider(
          thickness: 2,
          color: AppColors.primaryBlack.withOpacity(0.10),
        ),
      ),
      Html(
        data: irrigation.description,
        style: {
          "p": Style(
            padding: HtmlPaddings.symmetric(horizontal: 7),
            textAlign: TextAlign.justify,
          ),
        },
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Text(
          S.of(context).fertilizerInfo,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Divider(
          thickness: 2,
          color: AppColors.primaryBlack.withOpacity(0.10),
        ),
      ),

      fertilizer.fertilizer.contains("<table>")
          ? SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: SizeConfig.screenHeight,
                    child: Html(
                      shrinkWrap: true,
                      data: fertilizer.fertilizer,
                      style: {
                        "p": Style(
                          padding: HtmlPaddings.symmetric(horizontal: 7),
                          textAlign: TextAlign.justify,
                        ),
                      },
                    ),
                  );
                },
              ),
            )
          : Html(
              shrinkWrap: true,
              data: fertilizer.fertilizer,
              style: {
                "p": Style(
                  padding: HtmlPaddings.symmetric(horizontal: 7),
                  textAlign: TextAlign.justify,
                ),
              },
            ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Text(
          S.of(context).irrigationInformation,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Divider(
          thickness: 2,
          color: AppColors.primaryBlack.withOpacity(0.10),
        ),
      ),
      Html(
        data: irrigation.description,
        style: {
          "p": Style(
            padding: HtmlPaddings.symmetric(horizontal: 7),
            textAlign: TextAlign.justify,
          ),
        },
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Text(
          S.of(context).interculturalOperation,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Divider(
          thickness: 2,
          color: AppColors.primaryBlack.withOpacity(0.10),
        ),
      ),
      Html(
        data: intercultural.description,
        style: {
          "p": Style(
            padding: HtmlPaddings.symmetric(horizontal: 7),
            textAlign: TextAlign.justify,
          ),
          "li": Style(textAlign: TextAlign.justify),
        },
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Text(
          S.of(context).harvesingAndPreservation,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Divider(
          thickness: 2,
          color: AppColors.primaryBlack.withOpacity(0.10),
        ),
      ),
      Html(
        data: harvesting.description,
        style: {
          "p": Style(
            padding: HtmlPaddings.symmetric(horizontal: 7),
            textAlign: TextAlign.justify,
          ),
        },
      ),
    ],
  );
}
