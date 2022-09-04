import 'package:neat/generator.dart';

part 'dimensions.nt.dart';

@Neat.generate
abstract class Dimensions {
  static const double paddingLargest = 65;
  static const double paddingLarger = 40;
  static const double paddingLarge = 30;
  static const double paddingMedium = 20;
  static const double paddingSmall = 15;
  static const double paddingSmaller = 10;
  static const double paddingSmallest = 5;

  static const double spaceLargest = paddingLargest;
  static const double spaceLarger = paddingLarger;
  static const double spaceLarge = paddingLarge;
  static const double spaceMedium = paddingMedium;
  static const double spaceSmall = paddingSmall;
  static const double spaceSmaller = paddingSmaller;
  static const double spaceSmallest = paddingSmallest;

  static const double paddingPage = paddingLarge;

  static const double sizeMedium = 42;
  static const double sizeSmall = 35;

  static const double iconLarge = 24;
  static const double iconMedium = 18;
  static const double iconSmall = 12;

  static const double borderRadiusMedium = 10;
  static const double borderRadiusSmall = 8;
  static const double borderRadiusSmaller = 6;
}
