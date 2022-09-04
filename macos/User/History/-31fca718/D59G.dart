import 'dart:async';

import 'package:app_client/urban_driver_api/models/models.dart';
import 'package:app_client/user/user.dart';
import 'package:hive/hive.dart';
import 'package:app_client/auth/auth.dart';
import 'package:app_client/urban_driver_api/urban_driver_api.dart' as api;

import 'package:common/common.dart';

part '_exceptions.dart';

const String _kDefaultIDsBoxKey = "user_repository_defaults";
const String _kDefaultPassengerIDKey = "default_passenger_id";
const String _kDefaultPaymentMethodIDKey = "default_payment_method_id";

const String _kPaymentMethodCostCentersBoxKey =
    "default_payment_method_cost_center";
String _defaultPaymentMethodCostCenterKey(int methodID) =>
    "default_payment_method_${methodID}_cost_center";

class UserRepository {
  UserRepository({
    required this.authRepository,
  }) : _urbanDriver = api.UrbanDriverApiAuthClient(
          tokenProvider: authRepository.getToken,
          refreshToken: authRepository.refreshToken,
          onAuthFatalError: authRepository.logout,
        );

  final AuthRepository authRepository;
  final api.UrbanDriverApiAuthClient _urbanDriver;
  final _userStream = StreamController<User>.broadcast();
  User? _user;

  void dispose() {
    _userStream.close();
  }

  Stream<User> get userStream => _userStream.stream;

  Stream<UserInfos> get userInfosStream =>
      _userStream.stream.map((user) => user.infos);

  Stream<List<Address>> get favoriteAddressesStream =>
      _userStream.stream.map((user) => user.favoriteAddresses);

  Stream<List<Passenger>> get passengersStream =>
      _userStream.stream.map((user) => user.favoritePassengers);

  Stream<List<PaymentMethod>> get paymentMethodsStream =>
      _userStream.stream.map((user) => user.paymentMethods);

  Stream<List<Trip>> get tripsStream =>
      _userStream.stream.map((user) => user.trips);

  Stream<Passenger?> get defaultPassengerStream =>
      _userStream.stream.map((user) => user.defaultPassenger);

  Stream<PaymentMethod?> get defaultPaymentMethodStream =>
      _userStream.stream.map((user) => user.defaultPaymentMethod);

  User? get user => _user;

  int? get userID => userInfos?.userID;

  UserInfos? get userInfos => _user?.infos;

  List<FavoriteAddress>? get favoriteAddresses => _user?.favoriteAddresses;

  List<Passenger>? get favoritePassengers => _user?.favoritePassengers;

  List<Trip>? get trips => _user?.trips;

  List<PaymentMethod>? get paymentMethods => _user?.paymentMethods;

  Passenger? get defaultPassenger => _user?.defaultPassenger;

  PaymentMethod? get defaultPaymentMethod => _user?.defaultPaymentMethod;

  Future<void> fetch() => _fetchUser();

  Future<void> setDefaultPassengerID(int? id) async {
    final box = await _defaultIDsBox;
    await box.put(_kDefaultPassengerIDKey, id);
    await _mapPreferencesOnUser();
  }

  Future<void> setDefaultPaymentMethodID(int? id) async {
    final box = await _defaultIDsBox;
    await box.put(_kDefaultPaymentMethodIDKey, id);
    await _mapPreferencesOnUser();
  }

  Future<void> setPaymentMethodCostCenter(
    int methodID,
    String center,
  ) async {
    final box = await _paymentCostCentersBox;
    await box.put(_defaultPaymentMethodCostCenterKey(methodID), center);
    await _mapPreferencesOnUser();
  }

  /// if invalid form, throw [InvalidPassengerData]
  Future<void> newPassenger(
    NewPassengerFormData data,
  ) async {
    var batch = favoritePassengers ?? [];
    batch.add(Passenger(
      id: 0,
      firstName: data.firstName,
      lastName: data.lastName,
      mobile: data.phoneNumber,
      email: data.email ?? "",
    ));
    await _urbanDriver
        .passengerBatchReplace(PassengerBatchReplaceRequest.fromDomain(batch));
    await fetch();
  }

  Future<int?> get _defaultPassengerID async {
    final box = await _defaultIDsBox;
    return box.get(_kDefaultPassengerIDKey);
  }

  Future<int?> get _defaultPaymentMethodID async {
    final box = await _defaultIDsBox;
    final id = box.get(_kDefaultPaymentMethodIDKey);
    if (id != null) return id;
    final methods = paymentMethods;
    if (methods?.isNotEmpty ?? false) return methods?.first.id;
    return null;
  }

  Future<String?> _getPaymentMethodCostCenter(
    PaymentMethod method,
  ) async {
    if (method is! CompanyPaymentMethod) return null;
    final box = await _paymentCostCentersBox;
    final center = box.get(_defaultPaymentMethodCostCenterKey(method.id));
    if (method.availableCostCenters.contains(center)) return center;
    return null;
  }

  Future<void> _mapPreferencesOnUser() async {
    User? newUser = _user;
    if (newUser == null) return;
    newUser = await newUser
        .mapSelectedCostCentersOnPaymentMethods(_getPaymentMethodCostCenter);
    newUser = newUser.mapFavorites(
      passengerID: await _defaultPassengerID,
      paymentMethodID: await _defaultPaymentMethodID,
    );
    if (newUser != _user) {
      _user = newUser;
      _userStream.add(newUser);
    }
  }

  Future<void> _fetchUser() async {
    try {
      final getme = await _urbanDriver.getme();
      User user = getme.toDomain;
      user = await user
          .mapSelectedCostCentersOnPaymentMethods(_getPaymentMethodCostCenter);
      user = user.mapFavorites(
        passengerID: await _defaultPassengerID,
        paymentMethodID: await _defaultPaymentMethodID,
      );
      if (user != _user) {
        _user = user;
        _userStream.add(user);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Box<int?>> get _defaultIDsBox =>
      Hive.openBox<int?>(_kDefaultIDsBoxKey);
  Future<Box<String>> get _paymentCostCentersBox =>
      Hive.openBox<String>(_kPaymentMethodCostCentersBoxKey);
}

extension _MapCache on User {
  User mapFavorites({
    int? passengerID,
    int? paymentMethodID,
  }) {
    late final Passenger? passenger;
    late final PaymentMethod? paymentMethod;

    if (passengerID == null) {
      passenger = null;
    } else {
      try {
        passenger = favoritePassengers.firstWhere(
          (p) => p.id == passengerID,
        );
      } catch (e) {
        passenger = null;
      }
    }

    if (paymentMethodID == null) {
      paymentMethod = null;
    } else {
      try {
        paymentMethod = paymentMethods.firstWhere(
          (p) => p.id == paymentMethodID,
        );
      } catch (e) {
        paymentMethod = null;
      }
    }

    return copyWith(
      defaultPassenger: passenger,
      defaultPaymentMethod: paymentMethod,
    );
  }

  Future<User> mapSelectedCostCentersOnPaymentMethods(
    Future<String?> Function(PaymentMethod id) costCenterLookUp,
  ) async {
    Future<PaymentMethod> _bindCachedCostCenter(PaymentMethod m) async {
      if (m is CompanyPaymentMethod) {
        if (m.availableCostCenters.isEmpty) return m;
        final costCenter = await costCenterLookUp(m);
        return m.copyWith(
          costCenter: costCenter,
        );
      }
      return m;
    }

    final methods = await Stream.fromIterable(paymentMethods)
        .asyncMap(_bindCachedCostCenter)
        .toList();

    return copyWith(paymentMethods: methods);
  }
}
