// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/app_asset.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/app_constant.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/common/function/common_function.dart';
import 'package:aunkur_farmer/src/common/widget/app_constant_ui.dart';
import 'package:aunkur_farmer/src/common/widget/primary_text_buttom.dart';
import 'package:aunkur_farmer/src/feature/crop/bloc/crop_bloc.dart';
import 'package:aunkur_farmer/src/feature/home/presentation/widget/crop_card.dart';
import 'package:aunkur_farmer/src/feature/home/presentation/widget/crop_card_shimmer.dart';
import 'package:aunkur_farmer/src/feature/home/presentation/widget/top_info_card.dart';
import 'package:aunkur_farmer/src/feature/language/bloc/language_bloc.dart';
import 'package:aunkur_farmer/src/feature/language/presentation/widget/language_selection_buttom_sheet.dart';
import 'package:aunkur_farmer/src/service/api/base_client.dart';
import 'package:aunkur_farmer/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: scaffoldDefaultPadding),
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 40,
            leading: CircleAvatar(
              backgroundColor: AppColors.primary,
              radius: 10,
              child: Text(
                CommonFunction.extractInitials(
                  preference.getString(AppConstant.USER_NAME),
                ),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.lowWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CommonFunction.getGreetingMessage(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  "Hi, ${preference.getString(AppConstant.USER_NAME)}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            actions: [
              IconAndTextWidget(
                text: "",
                svgIcon: AppAssets.notifcatin,
                iconSize: 20,
                padding: 5,
                onTap: () async {
                  Navigator.pushNamed(context, '/NotificationPage');
                },
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              Text(
                S.current.quickAccess,
                style: Theme.of(context).textTheme.titleLarge,
              ),

              Row(
                spacing: 5,
                children: [
                  Expanded(
                    child: TopInfoCard(
                      // Updated Peach
                      title: S.current.crop,
                      iconSvg: AppAssets.crop,
                      index: 0,
                      onTap: () {
                        Navigator.pushNamed(context, '/CropListPage');
                      },
                    ),
                  ),
                  Expanded(
                    child: TopInfoCard(
                      title: S.current.finance,
                      iconSvg: AppAssets.farmer,
                      index: 1,
                      onTap: () {
                        Navigator.pushNamed(context, '/AgroServiceRequestPage');
                      },
                    ),
                  ),
                  Expanded(
                    child: TopInfoCard(
                      title: S.current.language,
                      iconSvg: AppAssets.languageIconSvg,
                      index: 2,
                      onTap: () {
                        languageSelectionButtonSheet(context, (dynamic value) {
                          context.read<LanguageBloc>().add(
                            ChangeLanguage(
                              Locale(value.toString().toLowerCase()),
                            ),
                          );

                          preference.saveData(AppConstant.language, value);
                        }, preference.getString(AppConstant.language));
                      },
                    ),
                  ),
                  Expanded(
                    child: TopInfoCard(
                      title: S.current.newsFeed,
                      iconSvg: AppAssets.newsIconSvg,
                      index: 3,
                      onTap: () {
                        // Navigator.pushNamed(context, '/NewsListPage');
                        AppConstantUI.showCustomSnackBar(
                          S.current.upcomingFeature,
                        );
                      },
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.current.cropInfo,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  PrimaryTextButtom(
                    title: S.current.viewAll,
                    onPressed: () {
                      Navigator.pushNamed(context, '/CropListPage');
                    },
                    textColor: AppColors.primaryBlack,
                  ),
                ],
              ),

              BlocConsumer<CropBloc, CropState>(
                listener: (context, state) {},

                builder: (context, state) {
                  if (state is CropLoading) {
                    return const CropCardShimmer();
                  } else if (state is CropError) {
                    return Center(child: Text(state.message));
                  } else if (state is CropListLoaded) {
                    return Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          context.read<CropBloc>().add(CropListRequestEvent());
                        },
                        child: ListView.separated(
                          itemCount: state.crops.length,

                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return CropCard(
                              model: state.crops[index],
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/CropProfile',
                                  arguments: state.crops[index].id,
                                );
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return 6.heightBox;
                          },
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
