import 'package:flutter/material.dart';
import 'package:animator/animator.dart';

void main() => runApp(AnimatedLogo());

class AnimatedLogo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Animator<double>(
      tween: Tween<double>(begin: 0, end: 300),
      cycles: 0,
      builder: (context, animatorState, child) => Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: animatorState.value,
          width: animatorState.value,
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
