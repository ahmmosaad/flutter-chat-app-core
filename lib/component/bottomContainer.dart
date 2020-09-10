
import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  BottomContainer({
    this.size,
    this.child
  });

  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15)),
      child: child,
    );
  }
}
