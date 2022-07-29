import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final Widget child;
  final double opacity;
  final bool isAsyncCall;
  final Color? color;
  final Animation<Color>? valueColor;
  const Loading({
    Key? key,
    required this.child,
    required this.isAsyncCall,
    this.color,
    this.opacity = 0.45,
    this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetLsit = [];
    widgetLsit.add(child);
    if (isAsyncCall) {
      final modal = modall();
      widgetLsit.add(modal);
    }
    return Stack(
      children: widgetLsit,
    );
  }

  Padding modall() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
      child: Stack(
        children: [
          Opacity(
            opacity: opacity,
            child: const ModalBarrier(
              color: Colors.white54,
              dismissible: false,
            ),
          ),
          Center(
            child: Transform.scale(
              scale: 2.5,
              child: const CircularProgressIndicator.adaptive(
                backgroundColor: Colors.orangeAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}