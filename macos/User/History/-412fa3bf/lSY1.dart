import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

final int _minAnimDurationMS = up.Feel.animationDuration.inMilliseconds;
final int _maxAnimDurationMS = up.Feel.animationDuration.inMilliseconds * 3;

class RopedSongCard extends StatelessWidget {
  const RopedSongCard({
    required this.random,
    required this.song,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final Random random;
  final VoidCallback? onTap;
  final up.Song song;

  int get _animDuration =>
      ((_maxAnimDurationMS - _minAnimDurationMS) * random.nextDouble())
          .toInt() +
      _minAnimDurationMS;

  @override
  Widget build(BuildContext context) {
    return FlipInX(
      duration: Duration(milliseconds: _animDuration),
      child: up.Tied(
        minAngle: -0.01,
        maxAngle: 0.01,
        random: _random,
        child: up.SongCard(
          song: songs[index],
          onTap:
              onSelectSong != null ? () => onSelectSong!(songs, index) : null,
        ),
      ),
    );
  }
}
