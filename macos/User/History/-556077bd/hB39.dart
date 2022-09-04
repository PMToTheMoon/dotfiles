import 'package:code_builder/code_builder.dart';

DartEmitter defaultEmitter([Allocator? allocator]) => DartEmitter(
      useNullSafetySyntax: true,
      orderDirectives: true,
      allocator: allocator ?? Allocator.none,
    );
