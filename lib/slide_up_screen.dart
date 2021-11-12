import 'package:flutter/material.dart';
import 'package:slideupscreen/index.dart';

abstract class SlideUpScreen extends StatefulWidget {
  const SlideUpScreen({Key? key}) : super(key: key);
  @override
  SlideUpScreenState createState();
}

abstract class SlideUpScreenState<T extends SlideUpScreen> extends State<T> {
  Widget body(BuildContext context);
  Widget? bottomBlock(BuildContext context);

  Color get backgroundColor => Colors.white;
  Radius get topRadius => Radius.zero;
  double get topOffset => 100;
  double get offsetToCollapse => 120;

  ScrollController _scrollController = ScrollController();
  bool _closed = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_onScroll);
  }

  @protected
  void _onScroll() {
    if (!_closed) {
      var offsetTop = _scrollController.offset;
      setState(() {
        if (offsetTop <= -offsetToCollapse) {
          _closed = true;
          Navigator.pop(context);
        }
      });
    }
  }

  @protected
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BodyBlock(
            backgroundColor: backgroundColor,
            topRadius: topRadius,
            topOffset: topOffset,
            scrollController: _scrollController,
            body: body(context),
          ),
          BottomBlock(bottomBlock: this.bottomBlock(context)),
        ],
      ),
    );
  }
}
