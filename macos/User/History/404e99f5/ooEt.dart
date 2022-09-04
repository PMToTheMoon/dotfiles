part of 'add_doctor_bloc.dart';

@freezed
class AddDocotorState with _$AddDocotorState {
  const AddDocotorState._();

  const factory AddDocotorState.initial() = _AddDocotorState;
  const factory AddDocotorState.fetch() = _AddDocotorState;
  const factory AddDocotorState.present() = _AddDocotorState;
}
