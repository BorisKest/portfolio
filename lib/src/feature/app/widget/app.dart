import 'package:portfolio/src/core/dependencies/widget/inherited_dpendencies.dart';
import 'package:portfolio/src/core/initialization/model/init_result.dart';
import 'package:portfolio/src/core/router/router_state_mixin.dart';
import 'package:portfolio/src/core/utils/window_scope/window_size_scope.dart';
import 'package:portfolio/src/feature/settings/bloc/settings_bloc.dart';
import 'package:portfolio/src/feature/settings/widget/settings_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// {@template app}
/// App widget.
/// {@endtemplate}
class App extends StatefulWidget {
  /// {@macro app}
  const App({
    super.key, // ignore: unused_element
    required this.result,
  });

  final InitializationResult result;

  void attach([VoidCallback? callback]) {
    callback?.call();
    runApp(
      InheritedDpendencies(
        dependencies: result.dependencies,
        child: SettingsScope(
          settingsBloc: SettingsBloc(),
          child: App(result: result),
        ),
      ),
    );
  }

  @override
  State<App> createState() => _AppState();
}

/// State for widget App.
class _AppState extends State<App> with RouterStateMixin<App> {
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(covariant App oldWidget) {
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
  Widget build(BuildContext context) => WindowSizeScope(
    child: MaterialApp.router(
      title: 'CarNeet',
      routerConfig: router.config,
      showPerformanceOverlay: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.lightGreen,
        brightness: Brightness.dark,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    ),
  );
}
