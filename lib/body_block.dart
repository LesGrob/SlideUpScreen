import 'package:flutter/material.dart';

@protected
class BodyBlock extends StatelessWidget {
  final Color backgroundColor;
  final Radius topRadius;
  final double topOffset;
  final ScrollController scrollController;
  final Widget? body;

  const BodyBlock({
    Key? key,
    required this.backgroundColor,
    required this.topRadius,
    required this.topOffset,
    required this.scrollController,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.vertical(top: topRadius)),
          margin: EdgeInsets.only(
            top: topOffset + MediaQuery.of(context).padding.top,
          ),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            controller: scrollController,
            physics:
                AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            child: Container(
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.vertical(top: topRadius)),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: topRadius),
                child: body,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
