import 'package:aunkur_farmer/src/common/constant/app_constant.dart';
import 'package:aunkur_farmer/src/feature/agroService/data/model/agro_request_payload.dart';
import 'package:aunkur_farmer/src/feature/agroService/repositories/agro_service_repo.dart';
import 'package:aunkur_farmer/src/feature/chat/data/model/conversation_model.dart';
import 'package:aunkur_farmer/src/service/api/base_client.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'agro_service_event.dart';
part 'agro_service_state.dart';

class AgroServiceBloc extends Bloc<AgroServiceEvent, AgroServiceState> {
  final AgroServiceRepo repo;
  AgroServiceBloc(this.repo) : super(AgroServiceInitial()) {
    on<AgroServiceEvent>((event, emit) async {
      emit(AgroServiceLoading());

      try {
        if (event is LoadAgroServiceEvent) {
          final List<ConversationModel> request = await repo.getConversations();
          if (request.isEmpty) {
            emit(AgroServiceEmpty());
          } else {
            emit(AgroServiceLoaded(request));
          }
        } else if (event is AgroServiceRequestCreateEvent) {
          await repo.createAgroServiceRequest(
            AgroRequestPayload(
              cropId: cropId,
              year: int.parse(year),
              seasonId: seasonId,
              landAmount: double.parse(landAmount),
              requestType: requestType,
              message: message,
              farmerId: preference.getInt(AppConstant.USER_ID),
            ),
          );
          emit(
            const AgroServiceRequestCreated(
              "Agro service request created successfully",
            ),
          );
        }
      } catch (e) {
        emit(AgroServiceError(e.toString()));
      }
    });
  }

  //============Agro Service Request Create Field Validation Logic============//
  final _cropController = BehaviorSubject<int>();
  Stream<int> get cropStream => _cropController.stream;
  void updateCrop(int cropId, BuildContext context) {
    if (cropId == 0) {
      _cropController.sink.addError("Please select a crop");
      return;
    }
    _cropController.add(cropId);
  }

  int get cropId => _cropController.valueOrNull ?? 0;

  // Year field validation logic
  final _yearController = BehaviorSubject<String>();
  Stream<String> get yearStream => _yearController.stream;
  void updateYear(String year, BuildContext context) {
    if (year.isEmpty) {
      _yearController.sink.addError("Year should not be empty");
      return;
    }
    _yearController.add(year);
  }

  String get year => _yearController.valueOrNull ?? '';

  // Season field validation logic
  final _seasonController = BehaviorSubject<int>();
  Stream<int> get seasonStream => _seasonController.stream;
  void updateSeason(int seasonId, BuildContext context) {
    if (seasonId == 0) {
      _seasonController.sink.addError("Please select a season");
      return;
    }
    _seasonController.add(seasonId);
  }

  int get seasonId => _seasonController.valueOrNull ?? 0;

  // Land Amount field validation logic
  final _landAmountController = BehaviorSubject<String>();
  Stream<String> get landAmountStream => _landAmountController.stream;
  void updateLandAmount(String landAmount, BuildContext context) {
    if (landAmount.isEmpty) {
      _landAmountController.sink.addError("Land amount should not be empty");
      return;
    }
    _landAmountController.add(landAmount);
  }

  String get landAmount => _landAmountController.valueOrNull ?? '';

  // Request type field validation logic
  final _requestTypeController = BehaviorSubject<String>();
  Stream<String> get requestTypeStream => _requestTypeController.stream;
  void updateRequestType(String requestType, BuildContext context) {
    if (requestType.isEmpty) {
      _requestTypeController.sink.addError("Please select a request type");
      return;
    }
    _requestTypeController.add(requestType);
  }

  String get requestType => _requestTypeController.valueOrNull ?? '';

  // Message field validation logic
  final _messageController = BehaviorSubject<String>();
  Stream<String> get messageStream => _messageController.stream;
  void updateMessage(String message, BuildContext context) {
    if (message.isEmpty) {
      _messageController.sink.addError("Message should not be empty");
      return;
    }
    _messageController.add(message);
  }

  String get message => _messageController.valueOrNull ?? '';

  // Create Agro Service Request Button validation logic
  Stream<bool> get createAgroServiceRequestButtonStream => Rx.combineLatest6(
    cropStream,
    yearStream,
    seasonStream,
    landAmountStream,
    requestTypeStream,
    messageStream,
    (cropId, year, seasonId, landAmount, requestTypeId, message) {
      if (cropId != 0 &&
          year.isNotEmpty &&
          seasonId != 0 &&
          landAmount.isNotEmpty &&
          requestTypeId != 0 &&
          message.isNotEmpty) {
        return true;
      }
      return false;
    },
  );
}
