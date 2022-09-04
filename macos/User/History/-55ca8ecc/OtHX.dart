part of 'user_account_bloc.dart';

@freezed
class UserAccountState with _$UserAccountState {
  const factory UserAccountState.initial() = _Initial;
  const factory UserAccountState.loading() = UserAccountLoading;
  const factory UserAccountState.ready() = UserAccountReady;
  const factory UserAccountState.error() = UserAccountError;
}
