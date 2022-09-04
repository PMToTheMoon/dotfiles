import 'package:flutter/material.dart';

class FormSection extends StatelessWidget {
  const FormSection({
    super.key,
    required this.title,
    required this.children,
    this.required = false,
  });

  final String title;
  final List<Widget> children;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return const Text('FormSection');
  }
}
