import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/common/widget/primary_button.dart';
import 'package:aunkur_farmer/src/feature/agroService/bloc/agro_service_bloc.dart';
import 'package:aunkur_farmer/src/feature/agroService/presentation/widget/agro_service_request_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgroServiceRequestPage extends StatefulWidget {
  const AgroServiceRequestPage({super.key});

  @override
  State<AgroServiceRequestPage> createState() => _AgroServiceRequestPageState();
}

class _AgroServiceRequestPageState extends State<AgroServiceRequestPage> {
  late BuildContext blcContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Agro Service Request',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(scaffoldDefaultPadding),
        child: SizedBox(
          height: 52,
          width: double.infinity,
          child: PrimaryButton(
            title: "Create New Request",
            onTap: () async {
              bool isSuccess =
                  await Navigator.pushNamed(
                    context,
                    '/CreateAgroServiceRequestPage',
                  ) ??
                  false;
              if (isSuccess) {
                blcContext.read<AgroServiceBloc>().add(LoadAgroServiceEvent());
              }
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(scaffoldDefaultPadding),
        child: BlocConsumer<AgroServiceBloc, AgroServiceState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            blcContext = context;
            if (state is AgroServiceLoading) {
              return loadingPageWidget();
            } else if (state is AgroServiceError) {
              return errorPageWidget(
                title: S.current.errorOccurred,
                onRetry: () =>
                    context.read<AgroServiceBloc>().add(LoadAgroServiceEvent()),
              );
            } else if (state is AgroServiceEmpty) {
              return emptyScreenWidget(
                title: S.current.empty,
                description: "No agro service request found",
                onAction: () {
                  context.read<AgroServiceBloc>().add(LoadAgroServiceEvent());
                },
              );
            } else if (state is AgroServiceLoaded) {
              return RefreshIndicator.adaptive(
                onRefresh: () async {
                  context.read<AgroServiceBloc>().add(LoadAgroServiceEvent());
                },
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return AgroServiceRequestCard(
                       onTap: () {
                          Navigator.pushNamed(
                          context,
                          '/ChatRoomPage',
                          arguments:  state.request[index].id,
                        );
                       },
                      model: state.request[index]);
                  },
                  separatorBuilder: (context, index) => 8.heightBox,
                  itemCount: state.request.length,
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
