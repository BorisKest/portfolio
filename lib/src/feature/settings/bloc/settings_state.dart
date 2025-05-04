part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.idle() = _Idle;
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.error() = _Error;
}
