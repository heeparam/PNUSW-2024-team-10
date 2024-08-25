import "dart:async";
import "dart:ui";

import "package:heron/utilities/ripple.dart";
import "package:flutter/material.dart";
import "package:hugeicons/hugeicons.dart";

class HeronNavigationBarItem {
  final String label;
  final IconData icon;

  const HeronNavigationBarItem({
    required this.label,
    required this.icon,
  });
}

class HeronNavigationBar extends StatelessWidget {
  final List<HeronNavigationBarItem> items;
  final int selectedIndex;
  final void Function(int)? onSelected;

  const HeronNavigationBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final backgroundColor = Theme.of(context).colorScheme.surfaceBright;

    return Container(
      height: 60.0 + bottomPadding,
      padding: EdgeInsets.only(bottom: bottomPadding),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
            width: 1.0,
          ),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: items.map(
            (item) {
              final index = items.indexOf(item);

              return _HeronNavigationBarItemWidget(
                  isSelected: index == selectedIndex,
                  onSelected: () {
                    onSelected?.call(index);
                  },
                  item: item);
            },
          ).toList(),
        ),
      ),
    );
  }
}

class _HeronNavigationBarItemWidget extends StatefulWidget {
  final bool isSelected;
  final HeronNavigationBarItem item;
  final void Function()? onSelected;

  const _HeronNavigationBarItemWidget({
    super.key,
    required this.isSelected,
    required this.item,
    this.onSelected,
  });

  @override
  State<_HeronNavigationBarItemWidget> createState() =>
      _HeronNavigationBarItemWidgetState();
}

class _HeronNavigationBarItemWidgetState
    extends State<_HeronNavigationBarItemWidget>
    with SingleTickerProviderStateMixin {
  final _itemKey = GlobalKey();
  final _containerKey = GlobalKey();
  final Duration pressDuration = const Duration(milliseconds: 24);
  final Duration releaseWaitDuration = const Duration(milliseconds: 120);
  final Duration releaseDuration = const Duration(milliseconds: 180);

  double itemWidth = 0.0;
  double containerWidth = 0.0;
  Completer<void>? _delayCompleter;
  bool _isPressed = false;

  late DateTime _pressStartTime;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  void _handlePointerUp() {
    if (_isPressed) {
      final elapsedTime = DateTime.now().difference(_pressStartTime);

      if (elapsedTime >= releaseWaitDuration) {
        // Release immediately if the duration has passed
        setState(() {
          _controller.reverse();
          _isPressed = false;
        });
      } else {
        final remainingTime = releaseWaitDuration - elapsedTime;
        _delayCompleter = Completer<void>();
        Future.delayed(remainingTime, () {
          if (_delayCompleter != null && !_delayCompleter!.isCompleted) {
            _delayCompleter!.complete();
            if (mounted) {
              setState(() {
                _isPressed = false;
                _controller.reverse();
              });
            }
          }
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: pressDuration,
      reverseDuration: releaseDuration,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.94).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        itemWidth = _itemKey.currentContext!.size!.width + 32.0;
        containerWidth = _containerKey.currentContext!.size!.width;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemColor = widget.isSelected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.outline;

    return Expanded(
      key: _containerKey,
      child: GestureDetector(
        onTap: widget.onSelected,
        child: Listener(
          onPointerDown: (_) {
            if (!widget.isSelected) {
              _pressStartTime = DateTime.now();
              if (_delayCompleter != null && !_delayCompleter!.isCompleted) {
                _delayCompleter!.complete();
              }
              setState(() {
                _controller.forward();
                _isPressed = true;
              });
            }
          },
          onPointerUp: (_) {
            _handlePointerUp();
          },
          onPointerCancel: (_) {
            _handlePointerUp();
          },
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: InkWell(
              customBorder: NavigationItemShapeBorder(
                widthFraction: itemWidth / containerWidth,
                heightInset: 6.0,
                borderRadius: BorderRadius.circular(6.0),
              ),
              splashFactory: HeronRipple.splashFactory,
              splashColor:
                  Theme.of(context).colorScheme.onSurface.withOpacity(0.05),
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: !widget.isSelected
                  ? () {
                      widget.onSelected?.call();
                    }
                  : null,
              child: Center(
                child: Column(
                  key: _itemKey,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HugeIcon(
                      icon: widget.item.icon,
                      color: itemColor,
                    ),
                    const SizedBox(height: 3.0),
                    Text(
                      widget.item.label,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: itemColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationItemShapeBorder extends ShapeBorder {
  final double widthFraction;
  final double heightInset;
  final BorderRadius borderRadius;

  const NavigationItemShapeBorder({
    required this.widthFraction,
    required this.heightInset,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    // Width is defined as a fraction of the original rect's width
    double customWidth = rect.width * widthFraction;
    double customHeight = rect.height - heightInset;

    // Center the shape within the original rect
    Rect customRect = Rect.fromCenter(
      center: rect.center,
      width: customWidth,
      height: customHeight,
    );

    // Return a rounded rectangle path with the specified border radius
    return Path()..addRRect(borderRadius.toRRect(customRect));
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // Inner path similar to outer path
    double customWidth = rect.width * widthFraction;
    double customHeight = rect.height - heightInset;

    Rect customRect = Rect.fromCenter(
      center: rect.center,
      width: customWidth,
      height: customHeight,
    );

    return Path()..addRRect(borderRadius.toRRect(customRect));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // No painting required, the path is handled by the decoration itself
  }

  @override
  ShapeBorder scale(double t) {
    return NavigationItemShapeBorder(
      widthFraction: widthFraction * t,
      heightInset: heightInset * t,
      borderRadius: borderRadius * t,
    );
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is NavigationItemShapeBorder) {
      return NavigationItemShapeBorder(
        widthFraction: lerpDouble(a.widthFraction, widthFraction, t)!,
        heightInset: lerpDouble(a.heightInset, heightInset, t)!,
        borderRadius: BorderRadius.lerp(a.borderRadius, borderRadius, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is NavigationItemShapeBorder) {
      return NavigationItemShapeBorder(
        widthFraction: lerpDouble(widthFraction, b.widthFraction, t)!,
        heightInset: lerpDouble(heightInset, b.heightInset, t)!,
        borderRadius: BorderRadius.lerp(borderRadius, b.borderRadius, t)!,
      );
    }
    return super.lerpTo(b, t);
  }
}
