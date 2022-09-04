import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

extension DisplayRequest on RequestType {
  String display(BuildContext context) {
    switch (this) {
      case RequestType.teleExpertise:
        return context.l10n.request_tele_expertise;
      case RequestType.consultation:
        return context.l10n.request_consultation;
    }
  }
}
