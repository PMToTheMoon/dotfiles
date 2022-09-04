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

  bool get isSelected => value.selectedRequestType != null;

  /// returns true if request type has been set and false otherwise.
  bool toggleRequestType(RequestType type) {
    if (value.selectedRequestType == type) {
      value = const DoctorConsultationRequestTileData.fold(
        selectedRequestType: null,
      );
      notifyListeners();
      return false;
    } else {
      value = DoctorConsultationRequestTileData.fold(
        selectedRequestType: type,
      );
      notifyListeners();
      return true;
    }
  }
}
