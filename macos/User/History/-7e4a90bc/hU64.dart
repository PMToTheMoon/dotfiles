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

  final ObservationCardDoctor doctor;
  final DateTime date;
  final List<ObservationCardDataPart> parts;
}

extension RecordToObservationCard on Record {
  bool isCreator(String userId) {
    return doctorId == userId;
  }

  ObservationCardDoctor _doctor({ 
    required String userId,
    required AvatarCacheService cacheService,
  }) {

  }

  ObservationCardData toObservationCardData({
    required String userId,
    required AvatarCacheService cacheService,
  }) {

    final doctor = ObservationCardDoctor(
      avatar: cacheService.avatar(record.doctorId?);
    );
    final date = DateTime.now();
    final parts = <ObservationCardDataPart>[];

    return ObservationCardData(doctor: doctor, date: date, parts: parts);
  }
}
