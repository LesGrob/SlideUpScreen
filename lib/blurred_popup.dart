import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slideupscreen/index.dart';

class BlurredPopup<T> extends PopupRoute<T> {
  static const double frostAnimationStartValue = 3.0;
  static const double frostAnimationEndValue = 3.0;

  final Widget screen;

  BlurredPopup(
      {required this.screen, RouteSettings? settings, ImageFilter? filter})
      : super(filter: filter, settings: settings);

  BlurredPopup.withSlideUp(
      {required SlideUpScreen screen,
      RouteSettings? settings,
      ImageFilter? filter})
      : this(screen: screen, filter: filter, settings: settings);

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
