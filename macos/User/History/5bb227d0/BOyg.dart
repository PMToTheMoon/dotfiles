import 'package:neat/generator.dart';

part 'dimensions.nt.dart';

@Neat.generate
abstract class Dimensions {
  static const double spaceHugest = 75;
  static const double spaceHuger = 69;
  static const double spaceHuge = 53;
  static const double spaceLargest = 34;
  static const double spaceLarger = 25;
  static const double spaceLarge = 20;
  static const double spaceMedium = 15;
  static const double spaceSmall = 15;
  static const double spaceSmaller = 10;
  static const double spaceSmallest = 5;

  static const double paddingLargest = spaceLargest;
  static const double paddingLarger = spaceLarger;
  static const double paddingLarge = spaceLarge;
  static const double paddingMedium = spaceMedium;
  static const double paddingSmall = spaceSmall;
  static const double paddingSmaller = spaceSmaller;
  static const double paddingSmallest = spaceSmallest;

  static const double sizeMedium = 35;
}
