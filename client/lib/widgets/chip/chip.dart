import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class HeronFilterChip extends StatelessWidget {
  final Widget child;
  final IconData? icon;
  final bool selected;
  final void Function(bool) onSelect;

  const HeronFilterChip({
    super.key,
    required this.child,
    this.icon,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = selected
        ? Theme.of(context).colorScheme.primaryContainer
        : Theme.of(context).colorScheme.surfaceBright;

    final borderColor = selected
        ? Theme.of(context).colorScheme.primaryContainer
        : Theme.of(context).colorScheme.outlineVariant;

    final textColor = selected
        ? Theme.of(context).colorScheme.onPrimaryContainer
        : Theme.of(context).colorScheme.onSurfaceVariant;

    final splashColor = selected
        ? Colors.transparent
        : Theme.of(context).colorScheme.onSurface.withOpacity(0.1);

    const borderRadius = 6.0;
    const borderWidth = 1.0;
    const animationDuration = Duration(milliseconds: 180);

    return AnimatedContainer(
      duration: animationDuration,
      height: 36.0,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: splashColor,
          highlightColor: Colors.transparent,
          splashFactory: InkRipple.splashFactory,
          borderRadius: BorderRadius.circular(borderRadius - borderWidth),
          onTap: () {
            onSelect(!selected);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Stack(
                    children: [
                      AnimatedOpacity(
                        opacity: selected ? 0.0 : 1.0,
                        duration: animationDuration,
                        child: Icon(
                          icon,
                          size: 16.0,
                          color: textColor,
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: selected ? 1.0 : 0.0,
                        duration: animationDuration,
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedTick02,
                          size: 16.0,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 6.0),
                ],
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: textColor,
                      ),
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
