import 'package:flutter/material.dart';

class FormSection extends StatelessWidget {
  const FormSection({
    super.key,
    required this.title,
    required this.children,
    bool required = false,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return const Text('FormSection');
  }
}
