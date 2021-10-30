import 'package:flutter/material.dart';

class BackgroundGradientWidget extends StatelessWidget {
  final Widget child;
  const BackgroundGradientWidget({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff1C192D),
            Color(0xff020715),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
