import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'profile_models.freezed.dart';
part 'profile_models.g.dart';

enum ThemeModeType {
  system,
  light,
  dark,
}

extension ThemeModeTypeExtension on ThemeModeType {
  ThemeMode get toThemeMode {
    switch (this) {
      case ThemeModeType.system:
        return ThemeMode.system;
      case ThemeModeType.light:
        return ThemeMode.light;
      case ThemeModeType.dark:
        return ThemeMode.dark;
    }
  }
}

enum Currency {
  INR,
  USD,
  EUR,
  GBP,
}

extension CurrencyExtension on Currency {
  String get symbol {
    switch (this) {
      case Currency.INR: return '₹';
      case Currency.USD: return '\$';
      case Currency.EUR: return '€';
      case Currency.GBP: return '£';
    }
  }
}

enum LandingPage {
  dashboard,
  history,
  analytics,
  wallet,
}

@freezed
class AppPreferences with _$AppPreferences {
  const factory AppPreferences({
    @Default(ThemeModeType.system) ThemeModeType themeMode,
    @Default(Currency.INR) Currency currency,
    @Default('en') String locale,
    String? defaultWorkspaceId,
    @Default(LandingPage.dashboard) LandingPage defaultLandingPage,
    @Default(false) bool biometricEnabled,
    @Default(true) bool analyticsEnabled,
  }) = _AppPreferences;

  factory AppPreferences.fromJson(Map<String, dynamic> json) => _$AppPreferencesFromJson(json);
}
