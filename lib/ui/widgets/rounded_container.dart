import 'package:flutter/material.dart';
import 'package:hidoc/common/styles/color_pallet.dart';

class RoundedContainer extends StatelessWidget {
  RoundedContainer({
    required this.child,
    this.borderRadius = 100,
    this.color,
    this.padding = const EdgeInsets.all(12),
    this.margin,
    this.borderColor,
  });

  Widget? child;
  final double borderRadius;
  Color? color;
  Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? ColorPalette.transparent),
          borderRadius: BorderRadius.circular(100),
          color: color ?? ColorPalette.lightRobineBlue,
        ),
        child: child);
  }
}
