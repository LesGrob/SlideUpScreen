import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slideupscreen/slideupscreen.dart';

class BlurredPopup extends PopupRoute<Null> {
  static const double frostAnimationStartValue = 3.0;
  static const double frostAnimationEndValue = 3.0;

  late final Widget screen;

  BlurredPopup({required this.screen});
  BlurredPopup.withSlideUp({required SlideUpScreen screen}) {
    this.screen = screen;
  }

  @override
  Color get barrierColor => Colors.black.withOpacity(0.32);

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => "";

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    var begin = Offset(0.0, 1.0);
    var end = Offset.zero;
    var curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(position: animation.drive(tween), child: child);
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      screen;
}

class BlurTransition extends AnimatedWidget {
  final Widget child;
  final Animation<double> animation;

  BlurTransition({required this.animation, required this.child})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return new BackdropFilter(
      filter: new ImageFilter.blur(
          sigmaX: animation.value, sigmaY: animation.value),
      child: child,
    );
  }
}
