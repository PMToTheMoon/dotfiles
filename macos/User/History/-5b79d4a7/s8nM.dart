import 'package:bloc_generators/bloc_generators.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:meta_proj/src/repo_test/repo_test.dart';

void main() {
  build(
    Path('lib', [
      RepoTest(),
    ]),
  );
}
