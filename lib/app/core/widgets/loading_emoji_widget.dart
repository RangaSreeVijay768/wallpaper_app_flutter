import 'dart:math';

import 'package:flutter/cupertino.dart';

class LoadingEmojiWidget extends StatefulWidget {
  const LoadingEmojiWidget({super.key});

  @override
  _LoadingEmojiWidgetState createState() =>
      _LoadingEmojiWidgetState();
}

class _LoadingEmojiWidgetState extends State<LoadingEmojiWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      lowerBound: 0.0,
      upperBound: 2 * pi, // Full rotation
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Center(
        child: Text(
          "🌀",
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
