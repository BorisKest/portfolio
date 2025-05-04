import 'package:portfolio/src/core/utils/mixin/context_extension.dart';
import 'package:portfolio/src/feature/settings/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract interface class ThemeScopeController {
  SettingsBloc get bloc;
}

/// {@template locale_scope_controller}
/// A controller that holds and operates the app locale.
/// {@endtemplate}
abstract interface class LocaleScopeController {
  /// Get the current [Locale]
  Locale get locale;

  /// List of available locals
  List<Locale> get availableLocals;

  /// Set locale to [locale].
  void setLocale(Locale locale);
}

/// {@template settings_scope_controller}
/// A controller that holds and operates the app settings.
/// {@endtemplate}
abstract interface class SettingsScopeController
    implements ThemeScopeController, LocaleScopeController {
  void toggleTemplate();
}

enum _SettingsScopeAspect {
  /// The theme aspect.
  theme,

  /// The locale aspect.
  locale,
}

/// {@template settings_scope}
/// Settings scope is responsible for handling settings-related stuff.
///
/// For example, it holds facilities to change
/// - theme seed color
/// - theme mode
/// - locale
/// {@endtemplate}
class SettingsScope extends StatefulWidget {
  /// {@macro settings_scope}
  const SettingsScope({
    required this.child,
    required this.settingsBloc,
    super.key,
  });

  /// The child widget.
  final Widget child;

  /// The [SettingsBloc] instance.
  final SettingsBloc settingsBloc;

  /// Get the [SettingsScopeController] of the closest [SettingsScope] ancestor.
  static SettingsScopeController of(
    BuildContext context, {
    bool listen = true,
  }) => context.inhOf<_InheritedSettingsScope>(listen: listen).controller;

  /// Get the [ThemeScopeController] of the closest [SettingsScope] ancestor.
  static ThemeScopeController themeOf(BuildContext context) =>
      context
          .inheritFrom<_SettingsScopeAspect, _InheritedSettingsScope>(
            aspect: _SettingsScopeAspect.theme,
          )
          .controller;

  /// Get the [LocaleScopeController] of the closest [SettingsScope] ancestor.
  static LocaleScopeController localeOf(BuildContext context) =>
      context
          .inheritFrom<_SettingsScopeAspect, _InheritedSettingsScope>(
            aspect: _SettingsScopeAspect.locale,
          )
          .controller;

  @override
  State<SettingsScope> createState() => _SettingsScopeState();
}

/// State for widget SettingsScope
class _SettingsScopeState extends State<SettingsScope>
    implements SettingsScopeController {
  @override
  void toggleTemplate() =>
      throw UnimplementedError('toggleTemplate() has not been implemented.');

  @override
  void setLocale(Locale locale) {
    throw UnimplementedError('setLocale() has not been implemented.');
  }

  @override
  SettingsBloc get bloc => widget.settingsBloc;
  @override
  Locale get locale => throw UnimplementedError(); //widget.settingsBloc.state.locale ?? const Locale('en');

  @override
  List<Locale> get availableLocals => AppLocalizations.supportedLocales;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SettingsBloc, SettingsState>(
        bloc: widget.settingsBloc,
        builder:
            (context, state) => _InheritedSettingsScope(
              controller: this,
              state: state,
              child: widget.child,
            ),
      );
}

class _InheritedSettingsScope extends InheritedModel<_SettingsScopeAspect> {
  const _InheritedSettingsScope({
    required this.controller,
    required this.state,
    required super.child,
  });

  final SettingsScopeController controller;
  final SettingsState state;

  @override
  bool updateShouldNotify(_InheritedSettingsScope oldWidget) =>
      state != oldWidget.state;

  @override
  bool updateShouldNotifyDependent(
    covariant _InheritedSettingsScope oldWidget,
    Set<_SettingsScopeAspect> dependencies,
  ) {
    var shouldNotify = false;

    if (dependencies.contains(_SettingsScopeAspect.theme)) {
      throw UnimplementedError();
    }

    if (dependencies.contains(_SettingsScopeAspect.locale)) {
      throw UnimplementedError();
    }

    return shouldNotify;
  }
}
