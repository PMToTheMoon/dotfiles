import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

class AvatarCacheService {
  AvatarCacheService({
    required this.rootUrl,
    required this.authProvider,
  });

  final String rootUrl;
  final api.AuthenticationProvider authProvider;

  ImageProvider avatar(String avatarId) {
    return CachedNetworkImageProvider(
      'https://training.zanalys.fr/api/user/avatar/$avatarId',
      headers: {'Authorization': 'bearer ${authProvider.getBearerToken()}'},
    );
  }
}
