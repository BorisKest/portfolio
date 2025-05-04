import 'package:portfolio/src/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:octopus/octopus.dart';

/// {@template not_found_screen}
/// NotFoundScreen widget.
/// {@endtemplate}
class NotFoundScreen extends StatefulWidget {
  /// {@macro not_found_screen}
  const NotFoundScreen({
    super.key, // ignore: unused_element
  });

  @override
  State<NotFoundScreen> createState() => _NotFoundScreenState();
}

/// State for widget NotFoundScreen.
class _NotFoundScreenState extends State<NotFoundScreen> {
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(covariant NotFoundScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget configuration changed
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: BackButton(
        onPressed: () {
          context.octopus.push(Routes.main);
        },
      ),
      title: const Text('Not Found'),
    ),
    body: const Center(child: Text('Not Found')),
  );
}
