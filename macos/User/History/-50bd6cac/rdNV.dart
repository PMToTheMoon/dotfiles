import 'dart:io';

import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart';

class Feature extends MetaObject {
  final Bloc? bloc;
  final Repository? bloc;
  final List<Widget> widgets;
  final List<Widget> models;

  @override
  Element<Feature> createElement() => LibraryElement(this);
}

final myCrudBlocKey = Key;

class MyList extends Seed {
  @override
  MetaObject build() {
    final bloc = Feature.of(context).bloc as CrudBloc;
  }
}

class MyCrudBloc extends Seed {
  @override
  MetaObject build() {
    final source = SourceRepository.of(context).xsource;
    return CrudBloc(
      key: myCrudBlocKey,
      name: 'name',
      source: xsource,
    );
  }
}

class CrudBloc extends Bloc {
  
}

class Bloc extends Seed {
  final List<EventHandler> handlers;

  // more or less Code builder objects;
  get bloc; // class
  get states; // union
  get events; // union

  @override
  MetaObject build() {
    return MultiPartLibrary(name: "bloc", specs: [
      bloc,
    ], parts: [
      Library(name: 'states', specs: [states,]),
      Library(name: 'event', specs: [events,]),
    ]);
  }
}

class BlocElement {
  bloc; // usefull meta data
  states; // usefull meta data
  events; // usefull meta data
}

void main(List<String> arguments) {
  print('Hello world: ${bonemeal.calculate()}!');
}
