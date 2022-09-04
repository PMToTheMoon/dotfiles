part of 'user_account_bloc.dart';

@freezed
class UserAccountState with _$UserAccountState {
  const factory UserAccountState.initial() = _Initial;
  const factory UserAccountState.loading() = UserAccountLoading;
  const factory UserAccountState.ready() = UserAccount;
  const factory UserAccountState.error() = UserAccount;
}
