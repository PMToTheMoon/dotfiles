import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AvatarCache {
  ImageProvider avatar(String avatarId) {
    return CachedNetworkImage();
  }
}
