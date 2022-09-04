import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

class AvatarCacheService {
  AvatarCacheService({
    required String rootUrl,
    required bool isDebug,
    required api.AuthenticationProvider authProvider,
  }) {
    _client = api.ZanalysPrivateApiClient(
      rootUrl,
      isDebug: isDebug,
      authenticationProvider: authProvider,
    );
  }

  late final api.ZanalysPrivateApiClient _client;

  void avatar(String avatarId) {
    // return CachedNetworkImage(https://training.zanalys.fr/api/user/avatar/UC959159903469);
  }
}
