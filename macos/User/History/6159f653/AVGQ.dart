part of 'hub_bloc.dart';

@freezed
class HubState with _$HubState {
  const factory HubState.initial() = HubInitial;

  const factory HubState.fetching() = HubFetching;

  const factory HubState.ready({
    required Record data,
  }) = HubReady;

  const factory HubState.error() = HubError;
}
