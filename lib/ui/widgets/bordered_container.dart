import 'package:flutter/material.dart';
import 'package:hidoc/common/styles/color_pallet.dart';

class BorderedContainer extends StatelessWidget {
  BorderedContainer({
    required this.child,
    this.borderRadius = 12,
    this.borderColor,
    this.padding,
    this.margin,
  });

  Widget? child;
  final double borderRadius;
  Color? borderColor = ColorPalette.lightgrey;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(this.borderRadius),
          border: Border.all(color: borderColor ?? ColorPalette.lightgrey, width: 0.5),
        ),
        child: child);
  }
}
