import 'package:flutter/material.dart';
import 'package:heron/widgets/theme/label.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: labelColors.getColor(color),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: DefaultTextStyle(
        style: textTheme.labelSmall!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          height: 1,
        ),
        child: child ?? const SizedBox(),
      ),
    );
  }
}
