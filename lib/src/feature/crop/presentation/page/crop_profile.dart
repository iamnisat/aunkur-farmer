import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/widget/helper.dart';
import 'package:aunkur_farmer/src/feature/crop/bloc/crop_bloc.dart';
import 'package:aunkur_farmer/src/feature/crop/presentation/widget/general_info.dart';
import 'package:aunkur_farmer/src/feature/crop/presentation/widget/herbicide_list.dart';
import 'package:aunkur_farmer/src/feature/crop/presentation/widget/pesticide_list.dart';
import 'package:aunkur_farmer/src/feature/crop/presentation/widget/varieties_list.dart';
import 'package:aunkur_farmer/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CropProfile extends StatefulWidget {
  final int cropId;
  const CropProfile({super.key, required this.cropId});

  @override
  State<CropProfile> createState() => _CropProfileState();
}

class _CropProfileState extends State<CropProfile>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int tabIndex = 0;

  bool isLoading = true;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(elevation: 0, title: Text(S.of(context).cropProfile)),
      body: Column(
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.transparent, // 👈 Removes the default underline
                  width: 0,
                ),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,

              labelColor: const Color(0xff19420E),
              labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: 14,
                color: AppColors.primaryWhite,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelColor: Colors.grey.shade500,
              unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium
                  ?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryWhite,
                  ),

              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.primaryBlack.withValues(alpha: 0.1),
              ),
              tabs: [
                Tab(text: S.of(context).cropInfo),
                Tab(text: S.of(context).pestAndDisease),
                Tab(text: S.of(context).herbicide),
                Tab(text: S.of(context).variety),
              ],
            ),
          ),

          BlocConsumer<CropBloc, CropState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is CropLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CropError) {
                return AppHelper.errorView(state.message);
              } else if (state is CropDetailLoaded) {
                return Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      CropGeneralInfo(
                        context: context,
                      ).cropGenealInfoView(state.crop),
                      PesticideList(
                        pesticides: state.pesticides,
                        cropId: widget.cropId,
                      ),

                      HerbicideList(herbicides: state.herbicides),
                      VarietiesList(model: state.varieties),
                      
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
