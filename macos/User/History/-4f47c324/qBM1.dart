import 'package:neat/generator.dart';

part 'dimensions.nt.dart';

@Neat.generate
class Dimensions {
  static const double spaceSmaller = 10;
  static const double spaceSmall = 15;
  static const double spaceMedium = 20;
  static const double spaceLarge = 30;
  static const double spaceLargest = 89;

  static const double paddingSmaller = spaceSmaller;
  static const double paddingSmall = spaceSmall;
  static const double paddingMedium = spaceMedium;
  static const double paddingLarge = spaceLarge;
  static const double paddingLargest = spaceLargest;

  static const double paddingPageSmall = spaceSmall;
  static const double paddingPageMedium = paddingMedium;

  static const double sizeSmallest = 14;
  static const double sizeSmaller = 30;
  static const double sizeSmall = 39;
  static const double sizeMedium = 48;
  static const double sizeLarge = 54;
  static const double sizeLargest = 133;

  static const double iconSmall = 16;
  static const double iconMedium = 24;
  static const double iconLarge = 28;

  static const double borderRadiusMedium = 12;
  static const double borderRadiusSmall = 8;
  static const double borderRadiusSmaller = 4;
}
