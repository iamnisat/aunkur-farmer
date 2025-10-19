import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/common/function/common_function.dart';
import 'package:aunkur_farmer/src/common/widget/app_constant_ui.dart';
import 'package:aunkur_farmer/src/common/widget/custom_dropdown_search.dart';
import 'package:aunkur_farmer/src/common/widget/primary_button.dart';
import 'package:aunkur_farmer/src/common/widget/primary_text_field.dart';
import 'package:aunkur_farmer/src/feature/agroService/bloc/agro_service_bloc.dart';
import 'package:aunkur_farmer/src/feature/authentication/data/model/common_model.dart';
import 'package:aunkur_farmer/src/feature/crop/data/model/crop_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<CropModel> globalCropList = [];

class CreateAgroServiceRequestPage extends StatelessWidget {
  const CreateAgroServiceRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AgroServiceBloc, AgroServiceState>(
      listener: (context, state) {
        if (state is AgroServiceError) {
          AppConstantUI.showCustomSnackBar(state.message);
        } else if (state is AgroServiceRequestCreated) {
          AppConstantUI.showCustomSnackBar(state.message);
          Navigator.pop(context, true);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Create Agro Request')),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(scaffoldDefaultPadding),
            child: SizedBox(
              height: 52,
              width: double.infinity,
              child: StreamBuilder<bool>(
                stream: context
                    .read<AgroServiceBloc>()
                    .createAgroServiceRequestButtonStream,
                builder: (context, asyncSnapshot) {
                  bool isEnable = asyncSnapshot.data ?? false;
                  return PrimaryButton(
                    title: "Submit",
                    isEnable: isEnable,
                    isLoading: state is AgroServiceLoading,
                    onTap: () {
                      context.read<AgroServiceBloc>().add(
                        AgroServiceRequestCreateEvent(),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(scaffoldDefaultPadding),

            child: SingleChildScrollView(
              child: Column(
                children: [
                  StreamBuilder<int>(
                    stream: context.read<AgroServiceBloc>().cropStream,
                    builder: (context, asyncSnapshot) {
                      return CustomDropdownSearch(
                        items: globalCropList
                            .map(
                              (e) => CommonModel(
                                id: e.id,
                                name: "${e.cropName} (${e.cropBanglaName})",
                              ),
                            )
                            .toList(),
                        labelText: S.current.selectCrop,
                        errorText: asyncSnapshot.error as String?,
                        onFieldSubmitted: (value) {
                          context.read<AgroServiceBloc>().updateCrop(
                            value.id,
                            context,
                          );
                          return;
                        },
                        onChanged: (value) {},
                      );
                    },
                  ),
                  17.heightBox,

                  StreamBuilder<String>(
                    stream: context.read<AgroServiceBloc>().yearStream,
                    builder: (context, asyncSnapshot) {
                      return CustomDropdownSearch(
                        items: CommonFunction.getYearList(),
                        errorText: asyncSnapshot.error as String?,
                        labelText: S.current.year,
                        onFieldSubmitted: (value) {
                          context.read<AgroServiceBloc>().updateYear(
                            value.name,
                            context,
                          );
                          return;
                        },
                        onChanged: (value) {},
                      );
                    },
                  ),
                  17.heightBox,

                  StreamBuilder<int>(
                    stream: context.read<AgroServiceBloc>().seasonStream,
                    builder: (context, asyncSnapshot) {
                      return CustomDropdownSearch(
                        items: CommonFunction.getSeasonList(),
                        labelText: S.current.selectSeason,
                        errorText: asyncSnapshot.error as String?,
                        onFieldSubmitted: (value) {
                          context.read<AgroServiceBloc>().updateSeason(
                            value.id,
                            context,
                          );
                          return;
                        },
                        onChanged: (value) {},
                      );
                    },
                  ),
                  17.heightBox,

                  StreamBuilder<String>(
                    stream: context.read<AgroServiceBloc>().landAmountStream,
                    builder: (context, snapshot) {
                      return PrimaryTextField(
                        errorText: snapshot.error as String?,
                        inputFormatters: [
                          // Allow only numbers and one dot for decimal point in the text field
                          decimalPlaceBinding,
                        ],
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          context.read<AgroServiceBloc>().updateLandAmount(
                            value,
                            context,
                          );
                          return;
                        },
                        hintText: S.current.landAmount,
                        labelText:
                            "${S.current.landAmount} (${S.current.shotok})",
                      );
                    },
                  ),

                  StreamBuilder<String>(
                    stream: context.read<AgroServiceBloc>().requestTypeStream,
                    builder: (context, asyncSnapshot) {
                      return CustomDropdownSearch(
                        items: CommonFunction.getAgroServiceRequestTypeList(),
                        labelText: S.current.requestType,
                        errorText: asyncSnapshot.error as String?,
                        onFieldSubmitted: (value) {
                          context.read<AgroServiceBloc>().updateRequestType(
                            value.slug,
                            context,
                          );
                          return;
                        },
                        onChanged: (value) {},
                      );
                    },
                  ),
                  17.heightBox,
                  StreamBuilder<String>(
                    stream: context.read<AgroServiceBloc>().messageStream,
                    builder: (context, snapshot) {
                      return PrimaryTextField(
                        errorText: snapshot.error as String?,

                        onChanged: (value) {
                          context.read<AgroServiceBloc>().updateMessage(
                            value,
                            context,
                          );
                          return;
                        },
                        hintText: S.current.message,
                        labelText: S.current.message,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
