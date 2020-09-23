import 'package:flutter/material.dart';
import 'package:animator/animator.dart';

void main() => runApp(MaterialApp(home: AnimatedLogo()));

class AnimatedLogo extends StatefulWidget {
  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  double _value = 0;

  final animatorKey = AnimatorKey();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Animator<dynamic>(
        animatorKey: animatorKey,
        tween: Tween<double>(begin: 0, end: 1),
        cycles: 0,
        builder: (context, animatorState, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
              opacity: _value,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 200,
                width: 200,
                child: FlutterLogo(), // Image.asset('assets/png/kiss.png'),
              ),
            ),
            SizedBox(height: 100),
            Container(
              color: Colors.white,
              // height: 300,
              // width: 400,
              child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      _value = animatorState.value;
                    });
                    animatorKey.triggerAnimation();
                    animatorKey.controller.stop;
                    print("I am pressed");
                  },
                  child: Center(
                    child: Text("Press ME!"),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

// class AnimatedWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 10),
//             // height: 200,
//             // width: 200,
//             child: Image.asset('assets/png/kiss.png'),
//           ),
//         ],
//       ),
//     );
//   }
// }
