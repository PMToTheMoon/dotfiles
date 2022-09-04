import 'dart:math';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:unusable_player/unusable_player.dart' as up;

/// Class [Swing]:
/// [key]: optional widget key reference
/// [child]: mandatory, widget to animate
/// [duration]: how much time the animation should take
/// [delay]: delay before the animation starts
/// [controller]: optional/mandatory, exposes the animation controller created by Animate_do
/// the controller can be use to repeat, reverse and anything you want, its just an animation controller
/// [from] from where you want to start the animation
/// [infinite] loops the animation until the widget is destroyed
class AlbumSwing extends StatefulWidget {
  final Key? key;
  final Widget child;
  final Duration duration;
  final Duration delay;
  final bool infinite;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;

  AlbumSwing(
      {this.key,
      required this.child,
      this.duration = const Duration(milliseconds: 1000),
      this.delay = const Duration(milliseconds: 0),
      this.infinite = false,
      this.controller,
      this.manualTrigger = false,
      this.animate = true})
      : super(key: key) {
    if (manualTrigger == true && controller == null) {
      throw FlutterError('If you want to use manualTrigger:true, \n\n'
          'Then you must provide the controller property, that is a callback like:\n\n'
          ' ( controller: AnimationController) => yourController = controller \n\n');
    }
  }

  @override
  _SwingState createState() => _SwingState();
}

/// State class, where the magic happens
class _SwingState extends State<AlbumSwing>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  bool disposed = false;
  late Animation<double> animationRotation1;
  late Animation<double> animationRotation2;
  late Animation<double> animationRotation3;
  late Animation<double> animationRotation4;
  late Animation<double> animationRotation5;
  late Animation<double> animationRotation6;
  @override
  void dispose() {
    disposed = true;
    controller!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animationRotation1 = Tween<double>(begin: 0, end: -0.5).animate(
        CurvedAnimation(
            parent: controller!,
            curve: Interval(0, 0.1666, curve: Curves.easeOut)));

    animationRotation2 = Tween<double>(begin: -0.5, end: 0.5).animate(
        CurvedAnimation(
            parent: controller!,
            curve: Interval(0.1666, 0.3333, curve: Curves.easeInOut)));

    // animationRotation3 = Tween<double>(begin: 0.5, end: -0.5).animate(
    //     CurvedAnimation(
    //         parent: controller!,
    //         curve: Interval(0.3333, 0.4999, curve: Curves.easeInOut)));

    // animationRotation4 = Tween<double>(begin: -0.5, end: 0.4).animate(
    //     CurvedAnimation(
    //         parent: controller!,
    //         curve: Interval(0.4999, 0.6666, curve: Curves.easeInOut)));

    // animationRotation5 = Tween<double>(begin: 0.4, end: -0.4).animate(
    //     CurvedAnimation(
    //         parent: controller!,
    //         curve: Interval(0.6666, 0.8333, curve: Curves.easeInOut)));

    // animationRotation6 = Tween<double>(begin: -0.4, end: 0).animate(
    //     CurvedAnimation(
    //         parent: controller!,
    //         curve: Interval(0.8333, 1, curve: Curves.easeOut)));

    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () {
        if (!disposed) {
          (widget.infinite) ? controller!.repeat() : controller?.forward();
        }
      });
    }

    if (widget.controller is Function) {
      widget.controller!(controller!);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animate && widget.delay.inMilliseconds == 0) {
      controller?.forward();
    }

    return AnimatedBuilder(
        animation: controller!,
        builder: (BuildContext context, Widget? child) {
          double angle = (animationRotation1.value != -0.5)
              ? animationRotation1.value
              // : (animationRotation2.value != 0.5)
              : animationRotation2.value;
          // : (animationRotation3.value != -0.5)
          //     ? animationRotation3.value
          //     : (animationRotation4.value != 0.4)
          //         ? animationRotation4.value
          //         : (animationRotation5.value != -0.4)
          //             ? animationRotation5.value
          //             : animationRotation6.value;

          return Transform.rotate(
            angle: angle,
            child: widget.child,
          );
        });
  }
}

final int _minAnimDurationMS = up.Feel.animationDuration.inMilliseconds;
final int _maxAnimDurationMS = up.Feel.animationDuration.inMilliseconds * 3;

class TiedAlbumCard extends StatelessWidget {
  const TiedAlbumCard({
    required this.random,
    required this.album,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final Random random;
  final VoidCallback? onTap;
  final up.Album album;

  int get _animDuration =>
      ((_maxAnimDurationMS - _minAnimDurationMS) * random.nextDouble())
          .toInt() +
      _minAnimDurationMS;

  @override
  Widget build(BuildContext context) {
    return AlbumSwing(
      duration: Duration(milliseconds: _animDuration),
      child: up.Tied(
        minAngle: -0.04,
        maxAngle: 0.04,
        random: random,
        child: up.AlbumCard(
          album: album,
          onTap: onTap,
        ),
      ),
    );
  }
}
