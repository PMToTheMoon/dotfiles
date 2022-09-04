const _kUrbanDriverApiDomainKey = "URBAN_DRIVER_API_DOMAIN";
const _kUrbanDriverApiBaseUrlKey = "URBAN_DRIVER_API_BASEURL";
const _kCguUrlKey = "CGU_URL";
const _kSupportUrlKey = "SUPPORT_URL";
const _kLegalMentionsUrlKey = "LEGAL_MENTIONS_URL";
const _kReportProblemUrlKey = "REPORT_PROBLEM_URL";
const _kMeetPointsUrlKey = "MEET_POINT_URL";
const _kSmsSalt = "SMS_SALT";

class Config {
  static const urbanDriverApiDomain =
      String.fromEnvironment(_kUrbanDriverApiDomainKey);

  static const urbanDriverApiBaseUrl =
      String.fromEnvironment(_kUrbanDriverApiBaseUrlKey);

  static const cguUrl = String.fromEnvironment(_kCguUrlKey);
  static const supportUrl = String.fromEnvironment(_kSupportUrlKey);
  static const reportProblemUrl = String.fromEnvironment(_kReportProblemUrlKey);
  static const legalMentionsUrl = String.fromEnvironment(_kLegalMentionsUrlKey);
  static const meetPointsUrl = String.fromEnvironment(_kMeetPointsUrlKey);

  static void ensureIsValid() {
    if (urbanDriverApiDomain.isEmpty) {
      throw "$_kUrbanDriverApiDomainKey config not found";
    }
    if (urbanDriverApiBaseUrl.isEmpty) {
      throw "$_kUrbanDriverApiBaseUrlKey config not found";
    }
    if (cguUrl.isEmpty) {
      throw "$_kCguUrlKey config not found";
    }
    if (supportUrl.isEmpty) {
      throw "$_kSupportUrlKey config not found";
    }
    if (reportProblemUrl.isEmpty) {
      throw "$_kReportProblemUrlKey config not found";
    }
    if (legalMentionsUrl.isEmpty) {
      throw "$_kLegalMentionsUrlKey config not found";
    }
    if (meetPointsUrl.isEmpty) {
      throw "$_kMeetPointsUrlKey config not found";
    }
  }
}
