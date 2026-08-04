// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppPreferencesImpl _$$AppPreferencesImplFromJson(Map<String, dynamic> json) =>
    _$AppPreferencesImpl(
      themeMode:
          $enumDecodeNullable(_$ThemeModeTypeEnumMap, json['themeMode']) ??
              ThemeModeType.system,
      currency: $enumDecodeNullable(_$CurrencyEnumMap, json['currency']) ??
          Currency.INR,
      locale: json['locale'] as String? ?? 'en',
      defaultWorkspaceId: json['defaultWorkspaceId'] as String?,
      defaultLandingPage: $enumDecodeNullable(
              _$LandingPageEnumMap, json['defaultLandingPage']) ??
          LandingPage.dashboard,
      biometricEnabled: json['biometricEnabled'] as bool? ?? false,
      analyticsEnabled: json['analyticsEnabled'] as bool? ?? true,
    );

Map<String, dynamic> _$$AppPreferencesImplToJson(
        _$AppPreferencesImpl instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeTypeEnumMap[instance.themeMode]!,
      'currency': _$CurrencyEnumMap[instance.currency]!,
      'locale': instance.locale,
      'defaultWorkspaceId': instance.defaultWorkspaceId,
      'defaultLandingPage': _$LandingPageEnumMap[instance.defaultLandingPage]!,
      'biometricEnabled': instance.biometricEnabled,
      'analyticsEnabled': instance.analyticsEnabled,
    };

const _$ThemeModeTypeEnumMap = {
  ThemeModeType.system: 'system',
  ThemeModeType.light: 'light',
  ThemeModeType.dark: 'dark',
};

const _$CurrencyEnumMap = {
  Currency.INR: 'INR',
  Currency.USD: 'USD',
  Currency.EUR: 'EUR',
  Currency.GBP: 'GBP',
};

const _$LandingPageEnumMap = {
  LandingPage.dashboard: 'dashboard',
  LandingPage.history: 'history',
  LandingPage.analytics: 'analytics',
  LandingPage.wallet: 'wallet',
};
