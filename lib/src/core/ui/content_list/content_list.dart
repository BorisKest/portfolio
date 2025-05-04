import 'package:portfolio/src/core/utils/window_scope/window_size_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// {@template content_list}
/// ContentList widget.
/// {@endtemplate}
class ContentList extends StatefulWidget {
  /// {@macro content_list}
  const ContentList({
    super.key, // ignore: unused_element
    required this.items,
    this.onSearch,
    this.onLoadMore,
    this.onRefresh,
    this.onFiltered,
    this.onSorted,
  });

  final List<Widget> items;
  final Function(String query)? onSearch;
  final Function()? onLoadMore;
  final Function()? onRefresh;
  final Function<T>(List<T> filters)? onFiltered;
  final Function<T>(T sort)? onSorted;

  @override
  State<ContentList> createState() => _ContentListState();
}

/// State for widget ContentList.
class _ContentListState extends State<ContentList> {
  final ScrollController _scrollController = ScrollController();
  WindowSize? _windowSize;

  void _scrollListner() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      widget.onLoadMore?.call();
    }
  }

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListner);
    // Initial state initialization
  }

  @override
  void didUpdateWidget(covariant ContentList oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget configuration changed
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _windowSize = WindowSizeScope.of(context);
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    // Permanent removal of a tree stent
    _scrollController.removeListener(_scrollListner);
    _scrollController.dispose();
    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) => Column(
    children: [
      // Search bar
      if (widget.onSearch != null)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) => widget.onSearch?.call(value),
            decoration: InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      if (widget.onFiltered != null)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonFormField<String>(
            items: const [
              DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
              DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
            ],
            onChanged: (value) => widget.onFiltered?.call([value]),
            decoration: InputDecoration(
              labelText: 'Filter',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          controller: _scrollController,
          itemCount: widget.items.length,

          itemBuilder:
              (context, index) =>
                  AspectRatio(aspectRatio: 1, child: widget.items[index]),
        ),
      ),
    ],
  );
}
