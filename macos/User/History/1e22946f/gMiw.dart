library neat;

export 'src/build_context_extensions/md2_texts.dart';
export 'src/build_context_extensions/md3_texts.dart';

export 'src/theme_accessors.dart';

/// {@template text_helper_usage}
/// This method forward every parameter to the [Text] widget constructor except 
/// the style property that will be merge with the the corresponding textTheme's
///  style using [TextStyle.merge()] method.
/// {@endtemplate text_helper_usage}