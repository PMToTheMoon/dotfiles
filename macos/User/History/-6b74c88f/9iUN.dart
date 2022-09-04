import 'package:neat/generator.dart';

part 'dimensions.nt.dart';

@Neat.generate
class Dimensions {
  //spaces
  static const double space5 = 8;
  static const double space4 = 13;
  static const double space3 = 21;
  static const double space2 = 34;
  static const double space1 = 55;

  //paddings
  static const double padding5 = space5;
  static const double padding4 = space4;
  static const double padding3 = space3;
  static const double padding2 = space2;
  static const double padding1 = space1;
  static const double paddingPage = padding3;

  //borders
  static const double borderRadius1 = 13;
  static const double borderRadius2 = 8;
  static const double borderRadius3 = 5;
  static const double borderSize = 2;

  //icons
  static const double icon1 = 34;
  static const double icon2 = 21;
  static const double icon3 = 13;
}
