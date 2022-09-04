import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class SongsController extends GetxController with StateMixin<List<up.Song>> {
  SongsController({
    required this.audioQueryService,
  });

  @override
  void onInit() {
    super.onInit();
    up.ThemeService.instance.themeMode.listen((_) => _querySongs());
    _querySongs();
  }

  @override
  void onClose() {
    _themeModeStreamSubscription.cancel();
  }

  final up.AudioQueryService audioQueryService;
  late final StreamSubscription<ThemeMode> _themeModeStreamSubscription;

  void _querySongs() {
    try {
      audioQueryService.querySongs().listen((song) {
        final List<up.Song> songs = List.from(state ?? [])..add(song);
        change(
          songs,
          status: songs.isNotEmpty ? RxStatus.success() : RxStatus.empty(),
        );
      });
    } catch (e) {
      change([], status: RxStatus.error(e.toString()));
    }
  }
}
