// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'record_doctors_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecordDoctorsEvent {
  Set<SelectedDoctor> get services => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Set<SelectedDoctor> services) servicesRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Set<SelectedDoctor> services)? servicesRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Set<SelectedDoctor> services)? servicesRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordDoctorsServicesRequested value)
        servicesRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RecordDoctorsServicesRequested value)? servicesRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordDoctorsServicesRequested value)? servicesRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecordDoctorsEventCopyWith<RecordDoctorsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordDoctorsEventCopyWith<$Res> {
  factory $RecordDoctorsEventCopyWith(
          RecordDoctorsEvent value, $Res Function(RecordDoctorsEvent) then) =
      _$RecordDoctorsEventCopyWithImpl<$Res>;
  $Res call({Set<SelectedDoctor> services});
}

/// @nodoc
class _$RecordDoctorsEventCopyWithImpl<$Res>
    implements $RecordDoctorsEventCopyWith<$Res> {
  _$RecordDoctorsEventCopyWithImpl(this._value, this._then);

  final RecordDoctorsEvent _value;
  // ignore: unused_field
  final $Res Function(RecordDoctorsEvent) _then;

  @override
  $Res call({
    Object? services = freezed,
  }) {
    return _then(_value.copyWith(
      services: services == freezed
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as Set<SelectedDoctor>,
    ));
  }
}

/// @nodoc
abstract class _$$RecordDoctorsServicesRequestedCopyWith<$Res>
    implements $RecordDoctorsEventCopyWith<$Res> {
  factory _$$RecordDoctorsServicesRequestedCopyWith(
          _$RecordDoctorsServicesRequested value,
          $Res Function(_$RecordDoctorsServicesRequested) then) =
      __$$RecordDoctorsServicesRequestedCopyWithImpl<$Res>;
  @override
  $Res call({Set<SelectedDoctor> services});
}

/// @nodoc
class __$$RecordDoctorsServicesRequestedCopyWithImpl<$Res>
    extends _$RecordDoctorsEventCopyWithImpl<$Res>
    implements _$$RecordDoctorsServicesRequestedCopyWith<$Res> {
  __$$RecordDoctorsServicesRequestedCopyWithImpl(
      _$RecordDoctorsServicesRequested _value,
      $Res Function(_$RecordDoctorsServicesRequested) _then)
      : super(_value, (v) => _then(v as _$RecordDoctorsServicesRequested));

  @override
  _$RecordDoctorsServicesRequested get _value =>
      super._value as _$RecordDoctorsServicesRequested;

  @override
  $Res call({
    Object? services = freezed,
  }) {
    return _then(_$RecordDoctorsServicesRequested(
      services: services == freezed
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as Set<SelectedDoctor>,
    ));
  }
}

/// @nodoc

class _$RecordDoctorsServicesRequested extends RecordDoctorsServicesRequested {
  const _$RecordDoctorsServicesRequested(
      {required final Set<SelectedDoctor> services})
      : _services = services,
        super._();

  final Set<SelectedDoctor> _services;
  @override
  Set<SelectedDoctor> get services {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_services);
  }

  @override
  String toString() {
    return 'RecordDoctorsEvent.servicesRequested(services: $services)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordDoctorsServicesRequested &&
            const DeepCollectionEquality().equals(other._services, _services));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_services));

  @JsonKey(ignore: true)
  @override
  _$$RecordDoctorsServicesRequestedCopyWith<_$RecordDoctorsServicesRequested>
      get copyWith => __$$RecordDoctorsServicesRequestedCopyWithImpl<
          _$RecordDoctorsServicesRequested>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Set<SelectedDoctor> services) servicesRequested,
  }) {
    return servicesRequested(services);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Set<SelectedDoctor> services)? servicesRequested,
  }) {
    return servicesRequested?.call(services);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Set<SelectedDoctor> services)? servicesRequested,
    required TResult orElse(),
  }) {
    if (servicesRequested != null) {
      return servicesRequested(services);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordDoctorsServicesRequested value)
        servicesRequested,
  }) {
    return servicesRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RecordDoctorsServicesRequested value)? servicesRequested,
  }) {
    return servicesRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordDoctorsServicesRequested value)? servicesRequested,
    required TResult orElse(),
  }) {
    if (servicesRequested != null) {
      return servicesRequested(this);
    }
    return orElse();
  }
}

abstract class RecordDoctorsServicesRequested extends RecordDoctorsEvent {
  const factory RecordDoctorsServicesRequested(
          {required final Set<SelectedDoctor> services}) =
      _$RecordDoctorsServicesRequested;
  const RecordDoctorsServicesRequested._() : super._();

  @override
  Set<SelectedDoctor> get services => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$RecordDoctorsServicesRequestedCopyWith<_$RecordDoctorsServicesRequested>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RecordDoctors {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Set<SelectedDoctor> request) postRequest,
    required TResult Function() success,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Set<SelectedDoctor> request)? postRequest,
    TResult Function()? success,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Set<SelectedDoctor> request)? postRequest,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordDoctorsPostRequest value) postRequest,
    required TResult Function(RecordDoctorsSuccess value) success,
    required TResult Function(RecordDoctorsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RecordDoctorsPostRequest value)? postRequest,
    TResult Function(RecordDoctorsSuccess value)? success,
    TResult Function(RecordDoctorsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordDoctorsPostRequest value)? postRequest,
    TResult Function(RecordDoctorsSuccess value)? success,
    TResult Function(RecordDoctorsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordDoctorsCopyWith<$Res> {
  factory $RecordDoctorsCopyWith(
          RecordDoctorsState value, $Res Function(RecordDoctorsState) then) =
      _$RecordDoctorsCopyWithImpl<$Res>;
}

/// @nodoc
class _$RecordDoctorsCopyWithImpl<$Res>
    implements $RecordDoctorsCopyWith<$Res> {
  _$RecordDoctorsCopyWithImpl(this._value, this._then);

  final RecordDoctorsState _value;
  // ignore: unused_field
  final $Res Function(RecordDoctorsState) _then;
}

/// @nodoc
abstract class _$$RecordDoctorsPostRequestCopyWith<$Res> {
  factory _$$RecordDoctorsPostRequestCopyWith(_$RecordDoctorsPostRequest value,
          $Res Function(_$RecordDoctorsPostRequest) then) =
      __$$RecordDoctorsPostRequestCopyWithImpl<$Res>;
  $Res call({Set<SelectedDoctor> request});
}

/// @nodoc
class __$$RecordDoctorsPostRequestCopyWithImpl<$Res>
    extends _$RecordDoctorsCopyWithImpl<$Res>
    implements _$$RecordDoctorsPostRequestCopyWith<$Res> {
  __$$RecordDoctorsPostRequestCopyWithImpl(_$RecordDoctorsPostRequest _value,
      $Res Function(_$RecordDoctorsPostRequest) _then)
      : super(_value, (v) => _then(v as _$RecordDoctorsPostRequest));

  @override
  _$RecordDoctorsPostRequest get _value =>
      super._value as _$RecordDoctorsPostRequest;

  @override
  $Res call({
    Object? request = freezed,
  }) {
    return _then(_$RecordDoctorsPostRequest(
      request: request == freezed
          ? _value._request
          : request // ignore: cast_nullable_to_non_nullable
              as Set<SelectedDoctor>,
    ));
  }
}

/// @nodoc

class _$RecordDoctorsPostRequest extends RecordDoctorsPostRequest {
  const _$RecordDoctorsPostRequest({required final Set<SelectedDoctor> request})
      : _request = request,
        super._();

  final Set<SelectedDoctor> _request;
  @override
  Set<SelectedDoctor> get request {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_request);
  }

  @override
  String toString() {
    return 'RecordDoctors.postRequest(request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordDoctorsPostRequest &&
            const DeepCollectionEquality().equals(other._request, _request));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_request));

  @JsonKey(ignore: true)
  @override
  _$$RecordDoctorsPostRequestCopyWith<_$RecordDoctorsPostRequest>
      get copyWith =>
          __$$RecordDoctorsPostRequestCopyWithImpl<_$RecordDoctorsPostRequest>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Set<SelectedDoctor> request) postRequest,
    required TResult Function() success,
    required TResult Function() error,
  }) {
    return postRequest(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Set<SelectedDoctor> request)? postRequest,
    TResult Function()? success,
    TResult Function()? error,
  }) {
    return postRequest?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Set<SelectedDoctor> request)? postRequest,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (postRequest != null) {
      return postRequest(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordDoctorsPostRequest value) postRequest,
    required TResult Function(RecordDoctorsSuccess value) success,
    required TResult Function(RecordDoctorsError value) error,
  }) {
    return postRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RecordDoctorsPostRequest value)? postRequest,
    TResult Function(RecordDoctorsSuccess value)? success,
    TResult Function(RecordDoctorsError value)? error,
  }) {
    return postRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordDoctorsPostRequest value)? postRequest,
    TResult Function(RecordDoctorsSuccess value)? success,
    TResult Function(RecordDoctorsError value)? error,
    required TResult orElse(),
  }) {
    if (postRequest != null) {
      return postRequest(this);
    }
    return orElse();
  }
}

abstract class RecordDoctorsPostRequest extends RecordDoctorsState {
  const factory RecordDoctorsPostRequest(
          {required final Set<SelectedDoctor> request}) =
      _$RecordDoctorsPostRequest;
  const RecordDoctorsPostRequest._() : super._();

  Set<SelectedDoctor> get request => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$RecordDoctorsPostRequestCopyWith<_$RecordDoctorsPostRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecordDoctorsSuccessCopyWith<$Res> {
  factory _$$RecordDoctorsSuccessCopyWith(_$RecordDoctorsSuccess value,
          $Res Function(_$RecordDoctorsSuccess) then) =
      __$$RecordDoctorsSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RecordDoctorsSuccessCopyWithImpl<$Res>
    extends _$RecordDoctorsCopyWithImpl<$Res>
    implements _$$RecordDoctorsSuccessCopyWith<$Res> {
  __$$RecordDoctorsSuccessCopyWithImpl(_$RecordDoctorsSuccess _value,
      $Res Function(_$RecordDoctorsSuccess) _then)
      : super(_value, (v) => _then(v as _$RecordDoctorsSuccess));

  @override
  _$RecordDoctorsSuccess get _value => super._value as _$RecordDoctorsSuccess;
}

/// @nodoc

class _$RecordDoctorsSuccess extends RecordDoctorsSuccess {
  const _$RecordDoctorsSuccess() : super._();

  @override
  String toString() {
    return 'RecordDoctors.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RecordDoctorsSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Set<SelectedDoctor> request) postRequest,
    required TResult Function() success,
    required TResult Function() error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Set<SelectedDoctor> request)? postRequest,
    TResult Function()? success,
    TResult Function()? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Set<SelectedDoctor> request)? postRequest,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordDoctorsPostRequest value) postRequest,
    required TResult Function(RecordDoctorsSuccess value) success,
    required TResult Function(RecordDoctorsError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RecordDoctorsPostRequest value)? postRequest,
    TResult Function(RecordDoctorsSuccess value)? success,
    TResult Function(RecordDoctorsError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordDoctorsPostRequest value)? postRequest,
    TResult Function(RecordDoctorsSuccess value)? success,
    TResult Function(RecordDoctorsError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class RecordDoctorsSuccess extends RecordDoctorsState {
  const factory RecordDoctorsSuccess() = _$RecordDoctorsSuccess;
  const RecordDoctorsSuccess._() : super._();
}

/// @nodoc
abstract class _$$RecordDoctorsErrorCopyWith<$Res> {
  factory _$$RecordDoctorsErrorCopyWith(_$RecordDoctorsError value,
          $Res Function(_$RecordDoctorsError) then) =
      __$$RecordDoctorsErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RecordDoctorsErrorCopyWithImpl<$Res>
    extends _$RecordDoctorsCopyWithImpl<$Res>
    implements _$$RecordDoctorsErrorCopyWith<$Res> {
  __$$RecordDoctorsErrorCopyWithImpl(
      _$RecordDoctorsError _value, $Res Function(_$RecordDoctorsError) _then)
      : super(_value, (v) => _then(v as _$RecordDoctorsError));

  @override
  _$RecordDoctorsError get _value => super._value as _$RecordDoctorsError;
}

/// @nodoc

class _$RecordDoctorsError extends RecordDoctorsError {
  const _$RecordDoctorsError() : super._();

  @override
  String toString() {
    return 'RecordDoctors.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RecordDoctorsError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Set<SelectedDoctor> request) postRequest,
    required TResult Function() success,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Set<SelectedDoctor> request)? postRequest,
    TResult Function()? success,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Set<SelectedDoctor> request)? postRequest,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordDoctorsPostRequest value) postRequest,
    required TResult Function(RecordDoctorsSuccess value) success,
    required TResult Function(RecordDoctorsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RecordDoctorsPostRequest value)? postRequest,
    TResult Function(RecordDoctorsSuccess value)? success,
    TResult Function(RecordDoctorsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordDoctorsPostRequest value)? postRequest,
    TResult Function(RecordDoctorsSuccess value)? success,
    TResult Function(RecordDoctorsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RecordDoctorsError extends RecordDoctorsState {
  const factory RecordDoctorsError() = _$RecordDoctorsError;
  const RecordDoctorsError._() : super._();
}
