import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BorderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Card(
      shape: RoundedRectangleBorder(),
    );
  }
}
