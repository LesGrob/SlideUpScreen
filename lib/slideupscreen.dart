import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: _body),
          _bottomBlock,
        ],
      ),
    );
  }

  Widget get _bottomBlock {
    if (this.bottomBlock(context) == null) {
      return Container();
    }
    return this.bottomBlock(context)!;
  }

  Widget get _body {
    return Container(
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
          controller: _scrollController,
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          child: Container(
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.vertical(top: topRadius)),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: topRadius),
              child: this.body(context),
            ),
          ),
        ),
      ),
    );
  }
}
