import 'package:common/common.dart';
import 'package:flutter/material.dart';

final menuBar = TbtMenuBar(
  children: [
    const TbtMenuSectionTitle('GENERAL'),
    TbtMenuLink(
      Icons.widgets_rounded,
      'UI Kit',
      onTap: () {},
    ),
    TbtMenuLink(
      Icons.table_chart_rounded,
      'Dashboard',
      onTap: () {},
    ),
    TbtMenuLink(
      Icons.library_add_check_rounded,
      'Cooptations',
      onTap: () {},
    ),
    const TbtMenuDivider(),
    const TbtMenuSectionTitle('GENERAL'),
    TbtMenuLink(
      Icons.widgets_rounded,
      'UI Kit',
      onTap: () {},
    ),
    TbtMenuLink(
      Icons.table_chart_rounded,
      'Dashboard',
      onTap: () {},
    ),
    TbtMenuLink(
      Icons.library_add_check_rounded,
      'Cooptations',
      onTap: () {},
    ),
  ],
);
