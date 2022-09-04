import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

List<Widget> _buildCards(BuildContext context) => [
      Card(
        child: Column(
          children: [
            context.titleMedium('Titre de la carte'),
            context.displayLarge('0'),
          ],
        ),
      ),
    ];
