part of 'crop_bloc.dart';

sealed class CropState extends Equatable {
  const CropState();

  @override
  List<Object> get props => [];
}

final class CropInitial extends CropState {}

final class CropLoading extends CropState {}

final class CropListLoaded extends CropState {
  final List<CropModel> crops;
  const CropListLoaded(this.crops);

  @override
  List<Object> get props => [crops];
}

final class CropDetailLoaded extends CropState {
  final CropDetailsModel crop;
  final List<VarietiesModel> varieties;
  final List<PesticideModel> pesticides;
  final List<HerbicideModel> herbicides;

  const CropDetailLoaded(this.crop,
      {this.varieties = const [],
      this.pesticides = const [],
      this.herbicides = const []});

  @override
  List<Object> get props => [crop, varieties, pesticides, herbicides];
}

final class CropError extends CropState {
  final String message;
  const CropError(this.message);

  @override
  List<Object> get props => [message];
}

// PesticideAndDiseaseState
final class PesticideAndDiseaseLoaded extends CropState {
  final PesticideDetailsModel pesticideDetails;
  const PesticideAndDiseaseLoaded(this.pesticideDetails);

  @override
  List<Object> get props => [pesticideDetails];
}
