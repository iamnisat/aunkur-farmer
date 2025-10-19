import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/app_asset.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/app_constant.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/common/function/common_function.dart';
import 'package:aunkur_farmer/src/common/widget/app_constant_ui.dart';
import 'package:aunkur_farmer/src/common/widget/common_dialog.dart';
import 'package:aunkur_farmer/src/feature/authentication/bloc/auth_bloc.dart';
import 'package:aunkur_farmer/src/feature/authentication/repositories/authentication_repository.dart';
import 'package:aunkur_farmer/src/feature/language/bloc/language_bloc.dart';
import 'package:aunkur_farmer/src/feature/language/presentation/widget/language_selection_buttom_sheet.dart';
import 'package:aunkur_farmer/src/feature/userProfile/presentation/widget/account_card.dart';
import 'package:aunkur_farmer/src/feature/userProfile/presentation/widget/profile_card.dart';
import 'package:aunkur_farmer/src/service/localStorage/locator_helper.dart';
import 'package:aunkur_farmer/src/service/localStorage/shared_preferences_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserProfilePage extends StatefulWidget {
  final bool showBackButton;
  const UserProfilePage({super.key, this.showBackButton = false});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final preferance = locatorHelper<SharedPreferencesHelper>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.profile),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: scaffoldDefaultPadding,
            ),
            child: IconAndTextWidget(
              onTap: () async {
                showCustomDialog(
                  context,
                  title: S.current.logout,
                  content: S.current.doYouWantToLogout,
                  onYes: () {
                    AuthenticationRepository().logout();
                  },
                );
              },
              iconSize: 20,
              padding: 5,
              isExpanded: false,
              backgroundColor: AppColors.borderColor,
              icon: Icons.logout_rounded,
              text: "",
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return loadingPageWidget();
            } else if (state is AuthFailure) {
              return errorPageWidget(
                title: S.current.errorOccurred,
                description:state.error);
            } else if (state is AuthUserProfileLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<AuthBloc>().add(AuthUserProfileEvent());
                },
                child: Column(
                  children: [
                    ProfileCard(user: state.user,),
                
                    20.heightBox,
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryWhite,
                        borderRadius: BorderRadius.circular(6),
                
                        border: Border.all(
                          color: AppColors.borderColor,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            color: AppColors.borderColor.withValues(alpha: 0.5),
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 12,
                            ),
                            child: Row(
                              spacing: 5,
                              children: [
                                SvgPicture.asset(
                                  AppAssets.settingsIconSvg,
                                  height: 18,
                                  width: 18,
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.primary,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                Text(
                                  S.current.settings,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                          8.heightBox,
                          ListView.separated(
                            shrinkWrap: true,
                            itemCount: AppAssets.profileIconItem.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return AccountCard(
                                leadingIconSvg: AppAssets.profileIconItem[index],
                                title: getProfileItem(index),
                                index: index,
                                onTap: () async {
                                  switch (index) {
                                    case 0:
                                      Navigator.pushNamed(
                                        context,
                                        '/NewPasswordPage',
                                      );
                                      break;
                
                                    case 1:
                                      languageSelectionButtonSheet(
                                        context,
                                        (dynamic value) {
                                          context.read<LanguageBloc>().add(
                                            ChangeLanguage(
                                              Locale(
                                                value.toString().toLowerCase(),
                                              ),
                                            ),
                                          );
                
                                          preferance.saveData(
                                            AppConstant.language,
                                            value,
                                          );
                                        },
                                        preferance.getString(
                                          AppConstant.language,
                                        ),
                                      );
                
                                      break;
                
                                    case 2:
                                      CommonFunction.launchAnyUrl(
                                        AppConstant.PRIVACY_POLICY_URL,
                                      );
                                      // TODO : Rate US
                                      break;
                                    case 3:
                                      CommonFunction.triggerInAppReview();
                
                                      break;
                                  }
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: textfieldgap);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
