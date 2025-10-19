import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/feature/authentication/data/model/common_model.dart';
import 'package:aunkur_farmer/src/feature/authentication/data/user_model.dart';
import 'package:aunkur_farmer/src/feature/authentication/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      try {
        if (event is AuthInitialEvent) {
          emit(AuthInitial());
          await getAllDivisions();
          emit(AuthInitSuccess());
        } else if (event is AuthRegistrationRequest) {
          emit(AuthLoading());
          bool status = await repository.registerUser(
            UserSignUpRequest(
              id: DateTime.now().millisecondsSinceEpoch,
              name: name,
              phone: phone,
              password: password,
              nid: nid,
              division: division,
              district: district,
              upazila: upazila,
              union: union,
              village: village,
            ),
          );
          if (status) {
            emit(AuthSuccess("Registration successful"));
          } else {
            emit(AuthFailure("Registration failed"));
          }
        } else if (event is AuthLoginRequestEvent) {
          emit(AuthLoading());
          final user = await repository.login(event.phone, event.password);
          emit(AuthSuccess("Login successful"));
          debugPrint("===>> User Token: ${user.token}");
        } else if (event is AuthUserProfileEvent) {
          emit(AuthLoading());
          final user = await repository.getUserProfileInfo();
          emit(AuthUserProfileLoaded(user));
        }
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }

  // Division list fetching logic can be added here
  List<CommonModel> divisionList = [];

  Future<void> getAllDivisions() async {
    try {
      divisionList.addAll(await repository.getDivisions());

      _divisionsListCtrl.add(divisionList); // NEW: emit to stream
    } catch (e) {
      debugPrint('Error fetching divisions: $e');
      _divisionsListCtrl.add(
        const [],
      ); // make UI gracefully disable the dropdown
    }
  }

  Future<void> _fetchDistricts(int divisionId) async {
    try {
      _districtsListCtrl.add(const []); // clear previous
      final res = await repository.getDistricts(divisionId);
      _districtsListCtrl.add(res);
    } catch (e) {
      _districtsListCtrl.add(const []);
    }
  }

  Future<void> _fetchUpazilas(int districtId) async {
    try {
      final res = await repository.getUpazilas(districtId);
      _upazilasListCtrl.add(res);
    } catch (e) {
      _upazilasListCtrl.add(const []);
    }
  }

  Future<void> _fetchUnions(int upazilaId) async {
    try {
      final res = await repository.getUnions(upazilaId);
      _unionsListCtrl.add(res);
    } catch (e) {
      _unionsListCtrl.add(const []);
    }
  }

  // User email validation logic
  final _phoneController = BehaviorSubject<String>();
  Stream<String> get phoneStream => _phoneController.stream;

  void updatePhone(String phone, BuildContext context) {
    if (phone.isEmpty) {
      _phoneController.sink.addError(S.of(context).phoneShouldnotBeEmpty);
      return;
    }

    _phoneController.add(phone);

    return;
  }

  // User password validation logic
  final _passwordController = BehaviorSubject<String>();
  Stream<String> get passwordStream => _passwordController.stream;

  void updatePassword(String password, BuildContext context) {
    if (password.isEmpty) {
      _passwordController.sink.addError(S.of(context).passwordShouldnotBeEmpty);
      return;
    }

    _passwordController.add(password);
  }

  // Name field validation logic
  final _nameController = BehaviorSubject<String>();
  Stream<String> get nameStream => _nameController.stream;
  void updateName(String name, BuildContext context) {
    if (name.isEmpty) {
      _nameController.sink.addError(S.of(context).nameShouldnotBeEmpty);
      return;
    }

    _nameController.add(name);
  }

  // Nid field validation logic
  final _nidController = BehaviorSubject<String>();
  Stream<String> get nidStream => _nidController.stream;
  void updateNid(String nid, BuildContext context) {
    if (nid.isEmpty) {
      _nidController.sink.addError(S.of(context).fieldShouldntBeEmpty);
      return;
    } else if (nid.length == 17 ||
        nid.length == 10 ||
        nid.length == 14 ||
        nid.length == 13) {
      // valid
    } else {
      _nidController.sink.addError(S.of(context).nidShouldNotBeEmpty);
      return;
    }

    _nidController.add(nid);
  }

  // Division field validation logic
  final _divisionController = BehaviorSubject<String>();
  Stream<String> get divisionStream => _divisionController.stream;
  void updateDivision(String division, BuildContext context) {
    if (division.isEmpty) {
      _divisionController.sink.addError(S.of(context).fieldShouldntBeEmpty);
      return;
    }
    _divisionController.add(division);

    // clear downstream
    _districtController.add('');
    _upazilaController.add('');
    _unionController.add('');
    _districtsListCtrl.add(const []);
    _upazilasListCtrl.add(const []);
    _unionsListCtrl.add(const []);

    // fetch next level
    final id = int.tryParse(division);
    if (id != null) {
      _fetchDistricts(id);
    }
  }

  // District field validation logic
  final _districtController = BehaviorSubject<String>();
  Stream<String> get districtStream => _districtController.stream;
  void updateDistrict(String district, BuildContext context) {
    if (district.isEmpty) {
      _districtController.sink.addError(S.of(context).fieldShouldntBeEmpty);
      return;
    }
    _districtController.add(district);

    // clear downstream
    _upazilaController.add('');
    _unionController.add('');
    _upazilasListCtrl.add(const []);
    _unionsListCtrl.add(const []);

    // fetch next level
    final id = int.tryParse(district);
    if (id != null) {
      _fetchUpazilas(id);
    }
  }

  // Upazila field validation logic
  final _upazilaController = BehaviorSubject<String>();
  Stream<String> get upazilaStream => _upazilaController.stream;
  void updateUpazila(String upazila, BuildContext context) {
    if (upazila.isEmpty) {
      _upazilaController.sink.addError(S.of(context).fieldShouldntBeEmpty);
      return;
    }
    _upazilaController.add(upazila);

    // clear downstream
    _unionController.add('');
    _unionsListCtrl.add(const []);

    // fetch next level
    final id = int.tryParse(upazila);
    if (id != null) {
      _fetchUnions(id);
    }
  }

  // Union field validation logic
  final _unionController = BehaviorSubject<String>();
  Stream<String> get unionStream => _unionController.stream;
  void updateUnion(String union, BuildContext context) {
    if (union.isEmpty) {
      _unionController.sink.addError(S.of(context).fieldShouldntBeEmpty);
      return;
    }
    _unionController.add(union);
  }

  // Village field validation logic
  final _villageController = BehaviorSubject<String>();
  Stream<String> get villageStream => _villageController.stream;
  void updateVillage(String village, BuildContext context) {
    if (village.isEmpty) {
      _villageController.sink.addError(S.of(context).fieldShouldntBeEmpty);
      return;
    }
    _villageController.add(village);
  }

  // Getters for the latest values
  String get phone => _phoneController.valueOrNull ?? '';
  String get password => _passwordController.valueOrNull ?? '';
  String get name => _nameController.valueOrNull ?? '';
  String get nid => _nidController.valueOrNull ?? '';
  String get division => _divisionController.valueOrNull ?? '';
  String get district => _districtController.valueOrNull ?? '';
  String get upazila => _upazilaController.valueOrNull ?? '';
  String get union => _unionController.valueOrNull ?? '';
  String get village => _villageController.valueOrNull ?? '';

  // Registration Button validation logic
  Stream<bool> get registrationButtonStream => Rx.combineLatest9(
    nameStream,
    phoneStream,
    passwordStream,
    nidStream,
    divisionStream,
    districtStream,
    upazilaStream, // NEW
    unionStream, // NEW
    villageStream,
    (name, phone, password, nid, division, district, upazila, union, village) {
      return name.isNotEmpty &&
          phone.isNotEmpty &&
          password.isNotEmpty &&
          nid.isNotEmpty &&
          division.isNotEmpty &&
          district.isNotEmpty &&
          upazila.isNotEmpty &&
          union.isNotEmpty &&
          village.isNotEmpty;
    },
  );

  // ====== NEW: list streams for dropdowns ======
  final _divisionsListCtrl = BehaviorSubject<List<CommonModel>>.seeded(
    const [],
  );
  final _districtsListCtrl = BehaviorSubject<List<CommonModel>>.seeded(
    const [],
  );
  final _upazilasListCtrl = BehaviorSubject<List<CommonModel>>.seeded(const []);
  final _unionsListCtrl = BehaviorSubject<List<CommonModel>>.seeded(const []);

  Stream<List<CommonModel>> get divisionsListStream =>
      _divisionsListCtrl.stream;
  Stream<List<CommonModel>> get districtsListStream =>
      _districtsListCtrl.stream;
  Stream<List<CommonModel>> get upazilasListStream => _upazilasListCtrl.stream;
  Stream<List<CommonModel>> get unionsListStream => _unionsListCtrl.stream;

  // Sign In Button validation logic
  Stream<bool> get signInButtonStream =>
      Rx.combineLatest2(phoneStream, passwordStream, (phone, password) {
        if (phone.isNotEmpty && password.isNotEmpty) {
          return true;
        }
        return false;
      });

  @override
  Future<void> close() {
    _divisionsListCtrl.close();
    _districtsListCtrl.close();
    _upazilasListCtrl.close();
    _unionsListCtrl.close();

    _phoneController.close();
    _passwordController.close();
    _nameController.close();
    _nidController.close();
    _divisionController.close();
    _districtController.close();
    _upazilaController.close();
    _unionController.close();
    _villageController.close();

    return super.close();
  }
}
