import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

class AvatarCacheService {
  AvatarCacheService() {
        _client = api.ZanalysPrivateApiClient(
      environment.rootURL,
      isDebug: environment.isDebugBuild,
      authenticationProvider: authService,
    );
  }

  late final api.ZanalysPrivateApiClient _client;

  ImageProvider avatar(String avatarId) {
    return CachedNetworkImage(https://training.zanalys.fr/api/user/avatar/UC959159903469);
  }
}
