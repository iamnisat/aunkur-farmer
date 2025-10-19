import 'package:aunkur_farmer/src/feature/agroService/presentation/page/create_agro_service_request_page.dart';
import 'package:aunkur_farmer/src/feature/crop/data/model/crop_details_model.dart';
import 'package:aunkur_farmer/src/feature/crop/data/model/crop_model.dart';
import 'package:aunkur_farmer/src/feature/crop/data/model/herbicide_model.dart';
import 'package:aunkur_farmer/src/feature/crop/data/model/pesticide_details_model.dart';
import 'package:aunkur_farmer/src/feature/crop/data/model/pesticide_model.dart';
import 'package:aunkur_farmer/src/feature/crop/data/model/varieties_model.dart';
import 'package:aunkur_farmer/src/feature/crop/repositories/crop_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crop_event.dart';
part 'crop_state.dart';

class CropBloc extends Bloc<CropEvent, CropState> {
  final CropRepo repo;
  CropBloc(this.repo) : super(CropInitial()) {
    on<CropEvent>((event, emit) async {
      try {
        emit(CropLoading());
        if (event is CropListRequestEvent) {
          globalCropList.clear();
          globalCropList.addAll(
            await repo.getCrops(page: event.page, size: event.size),
          );
          emit(CropListLoaded(globalCropList));
        } else if (event is CropDetailRequestEvent) {
          emit(
            CropDetailLoaded(
              await repo.getCropDetails(event.cropId),
              varieties: await repo.getVarieties(event.cropId),
              pesticides: await repo.getPesticides(event.cropId),
              herbicides: await repo.getHerbicides(event.cropId),
            ),
          );
        } else if (event is PesticideAndDiseaseRequestEvent) {
          emit(
            PesticideAndDiseaseLoaded(
              await repo.getPesticideDetails(event.pesticideId, event.cropId),
            ),
          );
        }
      } catch (e) {
        debugPrint(e.toString());
        emit(CropError(e.toString()));
      }
    });
  }
}
