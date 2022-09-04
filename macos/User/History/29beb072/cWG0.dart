import 'dart:typed_data';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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

  ImageProvider recordImage() {
    return AssetImage(Assets.images.records.general.keyName);
  }
}
