// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppPreferences _$AppPreferencesFromJson(Map<String, dynamic> json) {
  return _AppPreferences.fromJson(json);
}

/// @nodoc
mixin _$AppPreferences {
  ThemeModeType get themeMode => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;
  String? get defaultWorkspaceId => throw _privateConstructorUsedError;
  LandingPage get defaultLandingPage => throw _privateConstructorUsedError;
  bool get biometricEnabled => throw _privateConstructorUsedError;
  bool get analyticsEnabled => throw _privateConstructorUsedError;

  /// Serializes this AppPreferences to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppPreferencesCopyWith<AppPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppPreferencesCopyWith<$Res> {
  factory $AppPreferencesCopyWith(
          AppPreferences value, $Res Function(AppPreferences) then) =
      _$AppPreferencesCopyWithImpl<$Res, AppPreferences>;
  @useResult
  $Res call(
      {ThemeModeType themeMode,
      Currency currency,
      String locale,
      String? defaultWorkspaceId,
      LandingPage defaultLandingPage,
      bool biometricEnabled,
      bool analyticsEnabled});
}

/// @nodoc
class _$AppPreferencesCopyWithImpl<$Res, $Val extends AppPreferences>
    implements $AppPreferencesCopyWith<$Res> {
  _$AppPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? currency = null,
    Object? locale = null,
    Object? defaultWorkspaceId = freezed,
    Object? defaultLandingPage = null,
    Object? biometricEnabled = null,
    Object? analyticsEnabled = null,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeModeType,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      defaultWorkspaceId: freezed == defaultWorkspaceId
          ? _value.defaultWorkspaceId
          : defaultWorkspaceId // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultLandingPage: null == defaultLandingPage
          ? _value.defaultLandingPage
          : defaultLandingPage // ignore: cast_nullable_to_non_nullable
              as LandingPage,
      biometricEnabled: null == biometricEnabled
          ? _value.biometricEnabled
          : biometricEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      analyticsEnabled: null == analyticsEnabled
          ? _value.analyticsEnabled
          : analyticsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppPreferencesImplCopyWith<$Res>
    implements $AppPreferencesCopyWith<$Res> {
  factory _$$AppPreferencesImplCopyWith(_$AppPreferencesImpl value,
          $Res Function(_$AppPreferencesImpl) then) =
      __$$AppPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ThemeModeType themeMode,
      Currency currency,
      String locale,
      String? defaultWorkspaceId,
      LandingPage defaultLandingPage,
      bool biometricEnabled,
      bool analyticsEnabled});
}

/// @nodoc
class __$$AppPreferencesImplCopyWithImpl<$Res>
    extends _$AppPreferencesCopyWithImpl<$Res, _$AppPreferencesImpl>
    implements _$$AppPreferencesImplCopyWith<$Res> {
  __$$AppPreferencesImplCopyWithImpl(
      _$AppPreferencesImpl _value, $Res Function(_$AppPreferencesImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? currency = null,
    Object? locale = null,
    Object? defaultWorkspaceId = freezed,
    Object? defaultLandingPage = null,
    Object? biometricEnabled = null,
    Object? analyticsEnabled = null,
  }) {
    return _then(_$AppPreferencesImpl(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeModeType,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      defaultWorkspaceId: freezed == defaultWorkspaceId
          ? _value.defaultWorkspaceId
          : defaultWorkspaceId // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultLandingPage: null == defaultLandingPage
          ? _value.defaultLandingPage
          : defaultLandingPage // ignore: cast_nullable_to_non_nullable
              as LandingPage,
      biometricEnabled: null == biometricEnabled
          ? _value.biometricEnabled
          : biometricEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      analyticsEnabled: null == analyticsEnabled
          ? _value.analyticsEnabled
          : analyticsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppPreferencesImpl implements _AppPreferences {
  const _$AppPreferencesImpl(
      {this.themeMode = ThemeModeType.system,
      this.currency = Currency.INR,
      this.locale = 'en',
      this.defaultWorkspaceId,
      this.defaultLandingPage = LandingPage.dashboard,
      this.biometricEnabled = false,
      this.analyticsEnabled = true});

  factory _$AppPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppPreferencesImplFromJson(json);

  @override
  @JsonKey()
  final ThemeModeType themeMode;
  @override
  @JsonKey()
  final Currency currency;
  @override
  @JsonKey()
  final String locale;
  @override
  final String? defaultWorkspaceId;
  @override
  @JsonKey()
  final LandingPage defaultLandingPage;
  @override
  @JsonKey()
  final bool biometricEnabled;
  @override
  @JsonKey()
  final bool analyticsEnabled;

  @override
  String toString() {
    return 'AppPreferences(themeMode: $themeMode, currency: $currency, locale: $locale, defaultWorkspaceId: $defaultWorkspaceId, defaultLandingPage: $defaultLandingPage, biometricEnabled: $biometricEnabled, analyticsEnabled: $analyticsEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppPreferencesImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.defaultWorkspaceId, defaultWorkspaceId) ||
                other.defaultWorkspaceId == defaultWorkspaceId) &&
            (identical(other.defaultLandingPage, defaultLandingPage) ||
                other.defaultLandingPage == defaultLandingPage) &&
            (identical(other.biometricEnabled, biometricEnabled) ||
                other.biometricEnabled == biometricEnabled) &&
            (identical(other.analyticsEnabled, analyticsEnabled) ||
                other.analyticsEnabled == analyticsEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      themeMode,
      currency,
      locale,
      defaultWorkspaceId,
      defaultLandingPage,
      biometricEnabled,
      analyticsEnabled);

  /// Create a copy of AppPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppPreferencesImplCopyWith<_$AppPreferencesImpl> get copyWith =>
      __$$AppPreferencesImplCopyWithImpl<_$AppPreferencesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppPreferencesImplToJson(
      this,
    );
  }
}

abstract class _AppPreferences implements AppPreferences {
  const factory _AppPreferences(
      {final ThemeModeType themeMode,
      final Currency currency,
      final String locale,
      final String? defaultWorkspaceId,
      final LandingPage defaultLandingPage,
      final bool biometricEnabled,
      final bool analyticsEnabled}) = _$AppPreferencesImpl;

  factory _AppPreferences.fromJson(Map<String, dynamic> json) =
      _$AppPreferencesImpl.fromJson;

  @override
  ThemeModeType get themeMode;
  @override
  Currency get currency;
  @override
  String get locale;
  @override
  String? get defaultWorkspaceId;
  @override
  LandingPage get defaultLandingPage;
  @override
  bool get biometricEnabled;
  @override
  bool get analyticsEnabled;

  /// Create a copy of AppPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppPreferencesImplCopyWith<_$AppPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
