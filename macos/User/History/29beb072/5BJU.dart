import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:models/models.dart';

class AvatarCacheService {
  AvatarCacheService({
    required this.rootUrl,
    required this.getToken,
  });

  final String rootUrl;
  final String Function() getToken;

  ImageProvider avatar(String avatarId) {
    return CachedNetworkImageProvider(
      'https://training.zanalys.fr/api/user/avatar/$avatarId',
      headers: {'Authorization': 'bearer ${getToken()}'},
    );
  }

  ImageProvider recordImage(RecordType type) {
    switch (type) {
      case RecordType.general:
        return AssetImage(
          'records/general.png',
          package: 'common',
        );
      case RecordType.ecg:
        return AssetImage(
          'assets/images/records/general.png',
          package: 'common',
        );
    }
  }
}
