import 'package:flutter/material.dart';

/// {@template bottom_navigation_bar}
/// BNB widget.
/// {@endtemplate}
class BNB extends StatefulWidget {
  /// {@macro bottom_navigation_bar}
  const BNB({
    super.key, // ignore: unused_element
    this.currentIndex = 0,
    this.onTap,
  });

  final int currentIndex;
  final Function(int index)? onTap;

  @override
  State<BNB> createState() => _BNBState();
}

/// State for widget BNB.
class _BNBState extends State<BNB> {
  ThemeData? themeData;
  final Color defaultColor = Colors.grey;
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(covariant BNB oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget configuration changed
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    themeData = Theme.of(context);
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    // Permanent removal of a tree stent
    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
    selectedIconTheme: themeData?.iconTheme.copyWith(
      color: themeData?.colorScheme.primary,
    ),
    unselectedIconTheme: themeData?.iconTheme,
    showUnselectedLabels: false,
    useLegacyColorScheme: false,
    currentIndex: widget.currentIndex,
    onTap: widget.onTap,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
      BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ],
  );
}
