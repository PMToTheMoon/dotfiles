import 'package:flutter/material.dart';

extension ToMaterialProperty<T> on T {
  MaterialStateProperty<T> get msp => MaterialStateProperty.all(this);
}
