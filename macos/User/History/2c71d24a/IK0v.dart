import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum Gender {
  @JsonValue('M')
  male,
  @JsonValue('MME')
  female;

  String display(BuildContext context) {
    switch (this) {
      case Gender.male:
        return 'Homme';
      case Gender.female:
        return 'Femme';
    }
  }
}
