import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/common/widget/custom_search_bar.dart';
import 'package:aunkur_farmer/src/feature/crop/bloc/crop_bloc.dart';
import 'package:aunkur_farmer/src/feature/crop/data/model/crop_model.dart';
import 'package:aunkur_farmer/src/feature/home/presentation/widget/crop_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CropListPage extends StatefulWidget {
  const CropListPage({super.key});

  @override
  State<CropListPage> createState() => _CropListPageState();
}

class _CropListPageState extends State<CropListPage> {
  final TextEditingController _searchController = TextEditingController();
  List<CropModel> searchResults = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.current.cropInfo)),
      body: BlocConsumer<CropBloc, CropState>(
        listener: (context, state) {
          if (state is CropListLoaded) {
            searchResults = state.crops;
          }
        },
        builder: (context, state) {
          if (state is CropLoading) {
            return loadingPageWidget();
          } else if (state is CropError) {
            return errorPageWidget(
              title: S.current.errorOccurred,
              description: state.message,
              onRetry: () {
                context.read<CropBloc>().add(
                  CropListRequestEvent(page: 1, size: 100),
                );
              },
            );
          } else if (state is CropListLoaded) {
            final crops = state.crops;

            return Padding(
              padding: const EdgeInsets.all(scaffoldDefaultPadding),
              child: Column(
                children: [
                  CustomSearchBar(
                    controller: _searchController,
                    onTapSuffixIcon: () {
                      if (_searchController.text.isNotEmpty) {
                        _searchController.clear();
                        searchResults = crops;
                        setState(() {});
                      }
                    },

                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        searchResults = crops
                            .where(
                              (crop) =>
                                  crop.cropName.toLowerCase().contains(
                                    value.toLowerCase(),
                                  ) ||
                                  crop.cropBanglaName.toLowerCase().contains(
                                    value.toLowerCase(),
                                  ),
                            )
                            .toList();
                      } else {
                        searchResults = crops; // show all when search cleared
                      }
                      debugPrint(
                        'Search Query: $value, Results: ${searchResults.length}',
                      );
                      setState(() {});
                    },
                    hintText: "${S.of(context).searchHere}...",
                  ),
                  8.heightBox,
                  Expanded(
                    child: searchResults.isEmpty
                        ? emptyScreenWidget(
                            title: "No results found",
                            description:
                                "Try different keywords to find crops.",
                          )
                        : ListView.separated(
                            itemCount: searchResults.length,
                            itemBuilder: (context, index) {
                              return CropCard(
                                model: searchResults[index],
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/CropProfile',
                                    arguments: searchResults[index].id,
                                  );
                                },
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    6.heightBox,
                          ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
