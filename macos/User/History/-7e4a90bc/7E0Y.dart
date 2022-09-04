import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

import 'observation_card_data_part.dart';

class ObservationCardDoctor {
  const ObservationCardDoctor({
    required this.avatar,
    required this.firstName,
    required this.lastName,
    required this.subtitle,
    required this.specialty,
  });

  final ImageProvider avatar;
  final String firstName;
  final String lastName;
  final String subtitle;
  final String specialty;
}

class ObservationCardData {
  const ObservationCardData({
    required this.doctor,
    required this.date,
    required this.parts,
  });

  factory ObservationCardData.fromRecord(Record record) {
    final doctor = ObservationCardDoctor();
    final date = DateTime.now();
    final parts = <ObservationCardDataPart>[];

    return ObservationCardData(doctor: doctor, date: date, parts: parts);
  }

  final ObservationCardDoctor doctor;
  final DateTime date;
  final List<ObservationCardDataPart> parts;
}
