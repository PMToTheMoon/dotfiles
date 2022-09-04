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

  static const double paddingLargest = 49;
  static const double paddingLarger = 40;
  static const double paddingLarge = 33;
  static const double paddingMedium = 24;
  static const double paddingSmall = 18;
  static const double paddingSmaller = 12;
  static const double paddingSmallest = 5;

  static const double paddingPage = paddingMedium;

  static const double sizeMedium = 42;
  static const double sizeSmall = 35;

  static const double iconLarge = 24;
  static const double iconMedium = 18;
  static const double iconSmall = 12;
}
