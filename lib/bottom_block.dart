import 'package:flutter/widgets.dart';

@protected
class BottomBlock extends StatelessWidget {
  final Widget? bottomBlock;
  const BottomBlock({Key? key, this.bottomBlock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bottomBlock ?? const SizedBox();
  }
}
