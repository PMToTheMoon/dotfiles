enum BuildStatus {
  success,
  failure,
}

class BuildResult {
  final BuildStatus status;

  BuildResult.success() : status = BuildStatus.success;
  BuildResult.failure() : status = BuildStatus.failure;

  bool get isSuccess => status == BuildStatus.success;
}
