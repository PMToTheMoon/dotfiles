// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'doctor_consultation_request_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DoctorConsultationRequestTileData {
  ServiceType? get selectedRequestType => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ServiceType? selectedRequestType) fold,
    required TResult Function(ServiceType? selectedRequestType) unfold,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ServiceType? selectedRequestType)? fold,
    TResult Function(ServiceType? selectedRequestType)? unfold,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ServiceType? selectedRequestType)? fold,
    TResult Function(ServiceType? selectedRequestType)? unfold,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DoctorConsultationRequestTileFold value) fold,
    required TResult Function(DoctorConsultationRequestTileUnfold value) unfold,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DoctorConsultationRequestTileFold value)? fold,
    TResult Function(DoctorConsultationRequestTileUnfold value)? unfold,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DoctorConsultationRequestTileFold value)? fold,
    TResult Function(DoctorConsultationRequestTileUnfold value)? unfold,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DoctorConsultationRequestTileDataCopyWith<DoctorConsultationRequestTileData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorConsultationRequestTileDataCopyWith<$Res> {
  factory $DoctorConsultationRequestTileDataCopyWith(
          DoctorConsultationRequestTileData value,
          $Res Function(DoctorConsultationRequestTileData) then) =
      _$DoctorConsultationRequestTileDataCopyWithImpl<$Res>;
  $Res call({ServiceType? selectedRequestType});
}

/// @nodoc
class _$DoctorConsultationRequestTileDataCopyWithImpl<$Res>
    implements $DoctorConsultationRequestTileDataCopyWith<$Res> {
  _$DoctorConsultationRequestTileDataCopyWithImpl(this._value, this._then);

  final DoctorConsultationRequestTileData _value;
  // ignore: unused_field
  final $Res Function(DoctorConsultationRequestTileData) _then;

  @override
  $Res call({
    Object? selectedRequestType = freezed,
  }) {
    return _then(_value.copyWith(
      selectedRequestType: selectedRequestType == freezed
          ? _value.selectedRequestType
          : selectedRequestType // ignore: cast_nullable_to_non_nullable
              as ServiceType?,
    ));
  }
}

/// @nodoc
abstract class _$$DoctorConsultationRequestTileFoldCopyWith<$Res>
    implements $DoctorConsultationRequestTileDataCopyWith<$Res> {
  factory _$$DoctorConsultationRequestTileFoldCopyWith(
          _$DoctorConsultationRequestTileFold value,
          $Res Function(_$DoctorConsultationRequestTileFold) then) =
      __$$DoctorConsultationRequestTileFoldCopyWithImpl<$Res>;
  @override
  $Res call({ServiceType? selectedRequestType});
}

/// @nodoc
class __$$DoctorConsultationRequestTileFoldCopyWithImpl<$Res>
    extends _$DoctorConsultationRequestTileDataCopyWithImpl<$Res>
    implements _$$DoctorConsultationRequestTileFoldCopyWith<$Res> {
  __$$DoctorConsultationRequestTileFoldCopyWithImpl(
      _$DoctorConsultationRequestTileFold _value,
      $Res Function(_$DoctorConsultationRequestTileFold) _then)
      : super(_value, (v) => _then(v as _$DoctorConsultationRequestTileFold));

  @override
  _$DoctorConsultationRequestTileFold get _value =>
      super._value as _$DoctorConsultationRequestTileFold;

  @override
  $Res call({
    Object? selectedRequestType = freezed,
  }) {
    return _then(_$DoctorConsultationRequestTileFold(
      selectedRequestType: selectedRequestType == freezed
          ? _value.selectedRequestType
          : selectedRequestType // ignore: cast_nullable_to_non_nullable
              as ServiceType?,
    ));
  }
}

/// @nodoc

class _$DoctorConsultationRequestTileFold
    extends DoctorConsultationRequestTileFold {
  const _$DoctorConsultationRequestTileFold({this.selectedRequestType})
      : super._();

  @override
  final ServiceType? selectedRequestType;

  @override
  String toString() {
    return 'DoctorConsultationRequestTileData.fold(selectedRequestType: $selectedRequestType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorConsultationRequestTileFold &&
            const DeepCollectionEquality()
                .equals(other.selectedRequestType, selectedRequestType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(selectedRequestType));

  @JsonKey(ignore: true)
  @override
  _$$DoctorConsultationRequestTileFoldCopyWith<
          _$DoctorConsultationRequestTileFold>
      get copyWith => __$$DoctorConsultationRequestTileFoldCopyWithImpl<
          _$DoctorConsultationRequestTileFold>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ServiceType? selectedRequestType) fold,
    required TResult Function(ServiceType? selectedRequestType) unfold,
  }) {
    return fold(selectedRequestType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ServiceType? selectedRequestType)? fold,
    TResult Function(ServiceType? selectedRequestType)? unfold,
  }) {
    return fold?.call(selectedRequestType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ServiceType? selectedRequestType)? fold,
    TResult Function(ServiceType? selectedRequestType)? unfold,
    required TResult orElse(),
  }) {
    if (fold != null) {
      return fold(selectedRequestType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DoctorConsultationRequestTileFold value) fold,
    required TResult Function(DoctorConsultationRequestTileUnfold value) unfold,
  }) {
    return fold(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DoctorConsultationRequestTileFold value)? fold,
    TResult Function(DoctorConsultationRequestTileUnfold value)? unfold,
  }) {
    return fold?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DoctorConsultationRequestTileFold value)? fold,
    TResult Function(DoctorConsultationRequestTileUnfold value)? unfold,
    required TResult orElse(),
  }) {
    if (fold != null) {
      return fold(this);
    }
    return orElse();
  }
}

abstract class DoctorConsultationRequestTileFold
    extends DoctorConsultationRequestTileData {
  const factory DoctorConsultationRequestTileFold(
          {final ServiceType? selectedRequestType}) =
      _$DoctorConsultationRequestTileFold;
  const DoctorConsultationRequestTileFold._() : super._();

  @override
  ServiceType? get selectedRequestType;
  @override
  @JsonKey(ignore: true)
  _$$DoctorConsultationRequestTileFoldCopyWith<
          _$DoctorConsultationRequestTileFold>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DoctorConsultationRequestTileUnfoldCopyWith<$Res>
    implements $DoctorConsultationRequestTileDataCopyWith<$Res> {
  factory _$$DoctorConsultationRequestTileUnfoldCopyWith(
          _$DoctorConsultationRequestTileUnfold value,
          $Res Function(_$DoctorConsultationRequestTileUnfold) then) =
      __$$DoctorConsultationRequestTileUnfoldCopyWithImpl<$Res>;
  @override
  $Res call({ServiceType? selectedRequestType});
}

/// @nodoc
class __$$DoctorConsultationRequestTileUnfoldCopyWithImpl<$Res>
    extends _$DoctorConsultationRequestTileDataCopyWithImpl<$Res>
    implements _$$DoctorConsultationRequestTileUnfoldCopyWith<$Res> {
  __$$DoctorConsultationRequestTileUnfoldCopyWithImpl(
      _$DoctorConsultationRequestTileUnfold _value,
      $Res Function(_$DoctorConsultationRequestTileUnfold) _then)
      : super(_value, (v) => _then(v as _$DoctorConsultationRequestTileUnfold));

  @override
  _$DoctorConsultationRequestTileUnfold get _value =>
      super._value as _$DoctorConsultationRequestTileUnfold;

  @override
  $Res call({
    Object? selectedRequestType = freezed,
  }) {
    return _then(_$DoctorConsultationRequestTileUnfold(
      selectedRequestType: selectedRequestType == freezed
          ? _value.selectedRequestType
          : selectedRequestType // ignore: cast_nullable_to_non_nullable
              as ServiceType?,
    ));
  }
}

/// @nodoc

class _$DoctorConsultationRequestTileUnfold
    extends DoctorConsultationRequestTileUnfold {
  const _$DoctorConsultationRequestTileUnfold({this.selectedRequestType})
      : super._();

  @override
  final ServiceType? selectedRequestType;

  @override
  String toString() {
    return 'DoctorConsultationRequestTileData.unfold(selectedRequestType: $selectedRequestType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorConsultationRequestTileUnfold &&
            const DeepCollectionEquality()
                .equals(other.selectedRequestType, selectedRequestType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(selectedRequestType));

  @JsonKey(ignore: true)
  @override
  _$$DoctorConsultationRequestTileUnfoldCopyWith<
          _$DoctorConsultationRequestTileUnfold>
      get copyWith => __$$DoctorConsultationRequestTileUnfoldCopyWithImpl<
          _$DoctorConsultationRequestTileUnfold>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ServiceType? selectedRequestType) fold,
    required TResult Function(ServiceType? selectedRequestType) unfold,
  }) {
    return unfold(selectedRequestType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ServiceType? selectedRequestType)? fold,
    TResult Function(ServiceType? selectedRequestType)? unfold,
  }) {
    return unfold?.call(selectedRequestType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ServiceType? selectedRequestType)? fold,
    TResult Function(ServiceType? selectedRequestType)? unfold,
    required TResult orElse(),
  }) {
    if (unfold != null) {
      return unfold(selectedRequestType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DoctorConsultationRequestTileFold value) fold,
    required TResult Function(DoctorConsultationRequestTileUnfold value) unfold,
  }) {
    return unfold(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DoctorConsultationRequestTileFold value)? fold,
    TResult Function(DoctorConsultationRequestTileUnfold value)? unfold,
  }) {
    return unfold?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DoctorConsultationRequestTileFold value)? fold,
    TResult Function(DoctorConsultationRequestTileUnfold value)? unfold,
    required TResult orElse(),
  }) {
    if (unfold != null) {
      return unfold(this);
    }
    return orElse();
  }
}

abstract class DoctorConsultationRequestTileUnfold
    extends DoctorConsultationRequestTileData {
  const factory DoctorConsultationRequestTileUnfold(
          {final ServiceType? selectedRequestType}) =
      _$DoctorConsultationRequestTileUnfold;
  const DoctorConsultationRequestTileUnfold._() : super._();

  @override
  ServiceType? get selectedRequestType;
  @override
  @JsonKey(ignore: true)
  _$$DoctorConsultationRequestTileUnfoldCopyWith<
          _$DoctorConsultationRequestTileUnfold>
      get copyWith => throw _privateConstructorUsedError;
}
