part of 'create_record_bloc.dart';

@freezed
class CreateRecordState with _$CreateRecordState {
  const CreateRecordState._();

  const factory CreateRecordState.initial() = _CreateRecordState;
  const factory CreateRecordState.create() = _CreateRecordState;
  const factory CreateRecordState.success() = _CreateRecordState;
  const factory CreateRecordState.error() = _CreateRecordState;
}
