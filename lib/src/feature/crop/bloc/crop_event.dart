part of 'crop_bloc.dart';

sealed class CropEvent extends Equatable {
  const CropEvent();

  @override
  List<Object> get props => [];
}

final class CropListRequestEvent extends CropEvent {
  final int page;
  final int size;
  const CropListRequestEvent({this.page = 1, this.size = 10});
  @override
  List<Object> get props => [page, size];
}

final class CropDetailRequestEvent extends CropEvent {
  final int cropId;
  const CropDetailRequestEvent(this.cropId);

  @override
  List<Object> get props => [cropId];
}

final class PesticideAndDiseaseRequestEvent extends CropEvent {
  final int pesticideId;
  final int cropId;
  const PesticideAndDiseaseRequestEvent(this.pesticideId, this.cropId);

  @override
  List<Object> get props => [pesticideId];
}
