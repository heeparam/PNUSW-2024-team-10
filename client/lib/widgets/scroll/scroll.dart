import 'package:flutter/cupertino.dart';

class ScrollOffsetProvider extends StatefulWidget {
  final Widget Function(BuildContext context, double scrollOffset,
      ScrollController scrollController) builder;

  const ScrollOffsetProvider({
    super.key,
    required this.builder,
  });

  @override
  State<ScrollOffsetProvider> createState() => _ScrollOffsetProviderState();
}

class _ScrollOffsetProviderState extends State<ScrollOffsetProvider> {
  final ScrollController _scrollController = ScrollController();

  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    setState(() {
      _scrollOffset = _scrollController.offset;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _scrollOffset, _scrollController);
  }
}
