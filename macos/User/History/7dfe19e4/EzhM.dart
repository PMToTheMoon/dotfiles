import 'package:flutter/material.dart';
import 'package:models/models.dart';

import 'doctor_consultation_request_data.dart';

class DoctorConsultationRequestTileController
    extends ValueNotifier<DoctorConsultationRequestTileData> {
  DoctorConsultationRequestTileController({
    DoctorConsultationRequestTileData? initialState,
  }) : super(initialState ?? const DoctorConsultationRequestTileData.fold());

  void toggle() {
    value.map(
      fold: (_) => unfold(),
      unfold: (_) => fold(),
    );
  }

  void fold() {
    value = DoctorConsultationRequestTileData.fold(
      selectedRequestType: value.selectedRequestType,
    );
    notifyListeners();
  }

  void unfold() {
    value = DoctorConsultationRequestTileData.unfold(
      selectedRequestType: value.selectedRequestType,
    );
    notifyListeners();
  }

  /// returns true if request type has been set and false otherwise.
  bool toggleSelectRequestType(RequestType type) {
    if (value.selectedRequestType == type) {
      value = value.copyWith(selectedRequestType: null);
      notifyListeners();
      return false;
    } else {
      DoctorConsultationRequestTileData.fold(
        selectedRequestType: value.selectedRequestType,
      );
      value = value.copyWith(selectedRequestType: type);
      notifyListeners();
      return true;
    }
  }
}
