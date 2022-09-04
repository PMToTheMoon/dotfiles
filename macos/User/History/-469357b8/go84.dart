import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:neat/neat.dart';
import 'package:tech_by_tech/candidate/profile/professional_experiences/widgets/experience_header.dart';

class ExperienceExtension extends StatelessWidget {
  const ExperienceExtension({
    required this.experience,
    super.key,
  });

  final ProfessionalExperience experience;

  @override
  Widget build(BuildContext context) {
    return context.bodyMedium('''
Dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit.

Class aptent taciti sociosqu
Ad litora torquent per conubia nostra, per inceptos himenaeos.
Praesent auctor purus luctus enim egestas,
Ac scelerisque ante pulvinar. Donec ut rhoncus 
Exsuspendisse ac rhoncus nisl, eu 
''');
  }
}
