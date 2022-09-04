import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';

AstNode getAstNodeFromElement(Element element) {
  final session = element.session;
  final parsedLibrary = session!.getParsedLibraryByElement(element.library!)
      as ParsedLibraryResult;
  final elementDeclaration = parsedLibrary.getElementDeclaration(element);
  return elementDeclaration!.node;
}
