import 'package:flutter/material.dart';
import 'package:heron/theme/label.dart';

class HeronLabel extends StatelessWidget {
  final Widget? child;
  final HeronLabelColorType color;

  const HeronLabel({
    super.key,
    this.child,
    this.color = HeronLabelColorType.gray,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final labelColors = getHeronLabelColors(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: labelColors.getColor(color),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: DefaultTextStyle(
        style: textTheme.labelSmall!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        child: child ?? const SizedBox(),
      ),
    );
  }
}
