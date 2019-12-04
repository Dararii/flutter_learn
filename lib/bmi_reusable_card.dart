import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget child;
  final Function onTap;

  ReusableCard(
      {@required this.colour, @required this.child, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: this.colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
