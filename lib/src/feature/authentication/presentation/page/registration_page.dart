import 'dart:async';

import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/app_asset.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/common/widget/app_constant_ui.dart';
import 'package:aunkur_farmer/src/common/widget/custom_dropdown_search.dart';
import 'package:aunkur_farmer/src/common/widget/primary_button.dart';
import 'package:aunkur_farmer/src/common/widget/primary_text_field.dart';
import 'package:aunkur_farmer/src/feature/authentication/bloc/auth_bloc.dart';
import 'package:aunkur_farmer/src/feature/authentication/data/model/common_model.dart';
import 'package:aunkur_farmer/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  StreamController<bool> isVisiable = StreamController<bool>.broadcast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create New Account')),
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: context.read<AuthBloc>()..add(AuthInitialEvent()),
        listener: (context, state) {
          if (state is AuthFailure) {
            AppConstantUI.showCustomSnackBar(state.error, isError: true);
          } else if (state is AuthSuccess) {
            AppConstantUI.showCustomSnackBar(S.current.succesfull);
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/LoginPage',
              (Route<dynamic> route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AuthInitSuccess ||
              state is AuthFailure ||
              state is AuthLoading ||
              state is AuthSuccess) {
            return Padding(
              padding: const EdgeInsets.all(scaffoldDefaultPadding),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    10.heightBox,
                    StreamBuilder<String>(
                      stream: context.read<AuthBloc>().nameStream,
                      builder: (context, snapshot) {
                        return PrimaryTextField(
                          errorText: snapshot.error as String?,

                          onChanged: (value) {
                            context.read<AuthBloc>().updateName(value, context);
                            return;
                          },
                          hintText: S.current.name,
                          labelText: S.of(context).enterYourFullName,
                        );
                      },
                    ),

                    // Division
                    CustomDropdownSearch(
                      items: context.watch<AuthBloc>().divisionList,
                      labelText: S.current.selectDevision,
                      onFieldSubmitted: (v) {
                        context.read<AuthBloc>().updateDivision(
                          v.id.toString(),
                          context,
                        );
                      },
                      onChanged: (_) {},
                    ),

                    14.heightBox,
                    // District
                    StreamBuilder<List<CommonModel>>(
                      stream: context.read<AuthBloc>().districtsListStream,
                      builder: (_, snap) {
                        debugPrint('District List: ${snap.data}');
                        final items = snap.data ?? const <CommonModel>[];
                        return CustomDropdownSearch(
                          items: items,
                          labelText: S.current.selectDistrict,
                          onFieldSubmitted: (v) {
                            context.read<AuthBloc>().updateDistrict(
                              v.id.toString(),
                              context,
                            );
                          },
                          onChanged: (_) {},
                        );
                      },
                    ),
                    14.heightBox,
                    StreamBuilder<List<CommonModel>>(
                      stream: context.read<AuthBloc>().upazilasListStream,
                      builder: (context, asyncSnapshot) {
                        return CustomDropdownSearch(
                          items: asyncSnapshot.data ?? [],
                          labelText: S.current.selectUpazila,
                          onFieldSubmitted: (value) {
                            context.read<AuthBloc>().updateUpazila(
                              value.id.toString(),
                              context,
                            );
                          },
                          onChanged: (value) {},
                        );
                      },
                    ),
                    14.heightBox,
                    StreamBuilder<List<CommonModel>>(
                      stream: context.read<AuthBloc>().unionsListStream,
                      builder: (context, asyncSnapshot) {
                        return CustomDropdownSearch(
                          items: asyncSnapshot.data ?? [],
                          labelText: S.current.selectUnion,
                          onFieldSubmitted: (value) {
                            context.read<AuthBloc>().updateUnion(
                              value.id.toString(),
                              context,
                            );
                          },
                          onChanged: (value) {},
                        );
                      },
                    ),
                    14.heightBox,
                    StreamBuilder<String>(
                      stream: context.read<AuthBloc>().villageStream,
                      builder: (context, snapshot) {
                        return PrimaryTextField(
                          errorText: snapshot.error as String?,

                          onChanged: (value) {
                            context.read<AuthBloc>().updateVillage(
                              value,
                              context,
                            );
                            return;
                          },
                          hintText: "Enter your village name",
                          labelText: S.of(context).village,
                        );
                      },
                    ),
                    StreamBuilder<String>(
                      stream: context.read<AuthBloc>().phoneStream,
                      builder: (context, snapshot) {
                        return PrimaryTextField(
                          errorText: snapshot.error as String?,
                          inputFormatters: [
                            maskFormate,
                            LengthLimitingTextInputFormatter(19),
                          ],
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            context.read<AuthBloc>().updatePhone(
                              value,
                              context,
                            );
                            return;
                          },
                          hintText: "Ex : +880 1234 567 890",
                          labelText: S.of(context).mobileNumber,
                        );
                      },
                    ),
                    StreamBuilder<String>(
                      stream: context.read<AuthBloc>().passwordStream,
                      builder: (context, snapshot) {
                        return StreamBuilder<bool>(
                          stream: isVisiable.stream,
                          builder: (context, snap) {
                            return PrimaryTextField(
                              obscureText: snap.data ?? true,
                              errorText: snapshot.error as String?,
                              suffixIcon: snap.data ?? true
                                  ? AppAssets.invisibleIconSvg
                                  : AppAssets.visibleIconSvg,
                              onTapSuffixIcon: () {
                                isVisiable.add(!(snap.data ?? false));
                              },
                              onChanged: (value) {
                                context.read<AuthBloc>().updatePassword(
                                  value,
                                  context,
                                );
                                return;
                              },
                              hintText: "********",
                              labelText: S.of(context).password,
                            );
                          },
                        );
                      },
                    ),
                    StreamBuilder<String>(
                      stream: context.read<AuthBloc>().nidStream,
                      builder: (context, snapshot) {
                        return PrimaryTextField(
                          errorText: snapshot.error as String?,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(17),
                          ],

                          onChanged: (value) {
                            context.read<AuthBloc>().updateNid(value, context);
                            return;
                          },
                          hintText: "Enter your NID number",
                          labelText: S.of(context).nid,
                        );
                      },
                    ),

                    SizedBox(height: SizeConfig.screenHeight * 0.017),
                    StreamBuilder<bool>(
                      stream: context.read<AuthBloc>().registrationButtonStream,
                      builder: (context, asyncSnapshot) {
                        bool isEnable = asyncSnapshot.data ?? false;
                        return PrimaryButton(
                          title: "Next",
                          isEnable: isEnable,
                          isLoading: state is AuthLoading,
                          onTap: () {
                            context.read<AuthBloc>().add(
                              AuthRegistrationRequest(),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
