import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:translations/translations.dart';

@JsonEnum()
enum RecordType {
  @JsonValue('MULTI')
  general,

  @JsonValue('ECG')
  ecg;

  String displayName(BuildContext context) {
    switch (this) {
      case RecordType.general:
        return context.l10n.record_type_general;
      case RecordType.ecg:
        return context.l10n.record_type_ecg;
      // case RecordType.polygraphy:
      //   return context.l10n.record_type_polygraphy;
    }
  }

  String displaySubtile(BuildContext context) {
    switch (this) {
      case RecordType.general:
        return context.l10n.record_type_general;
      case RecordType.ecg:
        return context.l10n.record_type_ecg;
      // case RecordType.polygraphy:
      //   return context.l10n.record_type_polygraphy;
    }
  }
}
