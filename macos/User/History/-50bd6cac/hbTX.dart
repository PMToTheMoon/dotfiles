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

class FeatureElement extends Element<Feature>{
  void mount() {
    
  }
}

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

class CrudBloc extends Bloc {}

class Bloc extends Seed {
  final List<EventHandler> handlers;

  // more or less Code builder objects;
  final BlocClass bloc = BlocClass(
    name: "id",
  );

  Union get states; // union
  Union get events; // union

  @override
  MetaObject build() {
    return MultiPartLibrary(name: "bloc", specs: [
      bloc,
    ], parts: [
      Library(name: 'states', specs: [
        states,
      ]),
      Library(name: 'event', specs: [
        events,
      ]),
    ]);
  }
}

class BlocElement extends LibraryElement<Bloc> {
  BlocElement(super.metaObject);

  void mount(Element Parent) {}
}

void main(List<String> arguments) {
  print('Hello world: ${bonemeal.calculate()}!');

  Workspace(
    children:{

      Dir("ici", [
        Feature(
          "test",
          bloc: Bloc(),
          widgets:[

          ]
        )
      ])
    }
  )
}


final myBloc = CrudBloc();

final myList = LoadedList(
  bloc: myBloc,
);


class MyFeature extends Seed {
  final blocKey;

  @override
  MetaObject build() {
    return Feature(
      bloc: myBloc,
      widgets: [
        myList,
        PostForm(
          bloc: bloc,
        ),
      ],
    );
  }
}