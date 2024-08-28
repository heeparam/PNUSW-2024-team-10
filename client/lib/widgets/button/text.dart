import 'package:flutter/material.dart';
import 'package:heron/utilities/ripple.dart';

class HeronTextButton extends StatelessWidget {
  final Widget child;
  final Color? color;
  final void Function()? onPressed;
  final EdgeInsetsGeometry padding;

  const HeronTextButton({
    super.key,
    required this.child,
    this.color,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final themeColor = color ?? colorScheme.outline;

    return InkWell(
      borderRadius: BorderRadius.circular(4.0),
      splashFactory: HeronRipple.splashFactory,
      splashColor: themeColor.withOpacity(0.1),
      highlightColor: Colors.transparent,
      onTap: onPressed,
      child: Padding(
        padding: padding,
        child: DefaultTextStyle(
          style: TextStyle(
            color: themeColor,
            fontWeight: FontWeight.w600,
          ),
          child: child,
        ),
      ),
    );
  }
}
