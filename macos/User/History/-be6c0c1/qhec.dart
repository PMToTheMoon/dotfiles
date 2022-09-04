import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BuildStep {
  void out(String path, String content) {}
}

class MetaContext {}

abstract class MetaObject {
  void build(BuildStep step);
}

abstract class Seed extends MetaObject {
  @override
  @protected
  @nonVirtual
  void build(BuildStep step) {
    final object = grow(MetaContext());
    object.build(step);
  }

  MetaObject grow(MetaContext context);
}

// -----

class Path {
  Path(this.path, this.children);

  final String path;
  final List<MetaObject> children;

  void write(BuildStep step) {
    final childStep = BuildStep();
    for (final child in children) {
      child.write(childStep);
    }
  }
}

class Barrel {
  Barrel(this.path, this.children);

  final String path;
  final List<MetaObject> children;

  void write(BuildStep step) {
    final childStep = BuildStep();
    for (final child in children) {
      child.write(childStep);
    }
  }
}

class Form extends MetaObject {
  Form(this.fields);

  final List<String> fields;

  @override
  void build(BuildStep step) {
    final controller = FormController(fields);
    final controllerMeta = controller.build(step);

    // controller contain absolute path to file
    // step contain absolute path to this context
    // by comparing both we can deduce import
    step.refer(controllerMeta.controller);
  }
}

class FormController extends MetaObject {
  final List<String> fields;

  FormController(this.fields);

  @override
  void write(BuildStep step) {}
}

class MyPage extends MetaObject {
  MetaObject body;

  @override
  void write(BuildStep step) {
    final controller = FormController(fields);
    final controllerMeta = controller.write(step);


    // controller contain absolute path to file
    // step contain absolute path to this context
    // by comparing both we can deduce import
    step.refer(controllerMeta.controller);
  }
}

class MyPage extends Seed {
  MetaObject body;

  @override
  MetaObject grow(MetaContext context) {
    
    return ListView(
      Path(
        '/',
        [
          ctrl
        ]
      ),);
    
    }
}

build(MyPage(
  body: ListView()
))
