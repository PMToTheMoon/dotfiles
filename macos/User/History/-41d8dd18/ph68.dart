enum BuildStatus {
  success,
  failure,
}

class BuildResult {
  final BuildStatus status;

  BuildResult.success() : status = BuildStatus.success;
  BuildResult.success() : status = BuildStatus.failure;
}
