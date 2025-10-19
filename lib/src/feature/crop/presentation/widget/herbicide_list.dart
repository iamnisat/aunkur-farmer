import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/app_asset.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/common/widget/helper.dart';
import 'package:aunkur_farmer/src/feature/crop/data/model/herbicide_model.dart';
import 'package:aunkur_farmer/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_svg/svg.dart';

class HerbicideList extends StatelessWidget {
  final List<HerbicideModel> herbicides;
  const HerbicideList({super.key,required this.herbicides});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: herbicides.isEmpty? Center(
        child: AppHelper.emptyView(),
      ): ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: herbicides.length,
        itemBuilder: (BuildContext context, index) {
          return Column(
            children: [
              Container(
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.borderColor, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 12.0, 10.0, 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  herbicides[index].pesticideName,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1.0,
                              color: AppColors.borderColor,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Stack(
                        children: [
                          Positioned(
                            right: 0.0,
                            bottom: 0.0,
                            child: SvgPicture.asset(
                              AppAssets.leaf,
                              width: SizeConfig.screenWidth * 0.3,
                              color: AppColors.primaryYallow.withValues(
                                alpha: 0.1,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          S.of(context).tradeName,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                        ),
                                        Text(
                                          herbicides[index].tradeName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          S.of(context).genericName,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                        ),
                                        Text(
                                          herbicides[index].genericName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          S.of(context).companyName,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                        ),
                                        Text(
                                          herbicides[index].companyName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          S.of(context).doseApplication,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                        ),
                                        Text(
                                          "${herbicides[index].applicationDose} ml / liter",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          S.current.amountOfWater,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                        ),
                                        Text(
                                          "${herbicides[index].pesticideAmount} Liter / dec",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          S.of(context).price,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                        ),

                                        Text(
                                          "${herbicides[index].price} tk/${herbicides[index].applicationDoseUnitName}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          S.of(context).rating,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                        ),
                                        StarRating(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          halfFilledIcon: Icons.star_half,
                                          filledIcon: Icons.star,
                                          rating: herbicides[index].rating.toDouble(),

                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          S.current.priority,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                        ),
                                        Text(
                                          herbicides[index].priority.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Html(
                                data: "",
                                style: {
                                  "p": Style(color: Colors.white),
                                  "h1": Style(color: Colors.white),
                                  "h2": Style(color: Colors.white),
                                  "h3": Style(color: Colors.white),
                                  "h4": Style(color: Colors.white),
                                  "h5": Style(color: Colors.white),
                                  "h6": Style(color: Colors.white),
                                  "a": Style(color: Colors.white),
                                  "li": Style(color: Colors.white),
                                  "ul": Style(color: Colors.white),
                                  "ol": Style(color: Colors.white),
                                  "b": Style(color: Colors.white),
                                  "i": Style(color: Colors.white),
                                  "strong": Style(color: Colors.white),
                                  "em": Style(color: Colors.white),
                                  "blockquote": Style(color: Colors.white),
                                  "code": Style(color: Colors.white),
                                  "pre": Style(color: Colors.white),
                                  "span": Style(color: Colors.white),
                                  "div": Style(color: Colors.white),
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => 8.heightBox,
      ),
    );
  }
}
