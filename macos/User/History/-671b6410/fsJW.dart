import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

List<Widget> cards(BuildContext context) => [
      Card(
        child: Column(
          children: [
            context.titleMedium('Titre de la carte'),
            context.displayLarge('0'),
          ],
        ),
      ),
    ];
