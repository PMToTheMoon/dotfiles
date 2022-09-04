import 'dart:io';

import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart';

class MyFeature extends Seed {
  final Key<CrudBloc> blocKey;

  @override
  MetaObject build() {


    return Directory(
      children: [
    MyCrudBloc(
      key: blocKey,
    ),
    LoadedList(
      bloc: blocKey,
    );
      ]
    ),
  }
}

class MyCrudBloc extends Seed {
  @override
  MetaObject build() {
    final source = SourceRepository.of(context).xsource;
    return CrudBloc(
      name: 'name',
      source: xsource,
    );
  }
}

class CrudBloc extends Seed {
  @override
  MetaObject build() {
    return Bloc();
  }
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
