import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class ExperienceFull extends StatelessWidget {
  const ExperienceFull({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        context.bodyMedium('''
Dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit.

Class aptent taciti sociosqu
Ad litora torquent per conubia nostra, per inceptos himenaeos.
Praesent auctor purus luctus enim egestas,
Ac scelerisque ante pulvinar. Donec ut rhoncus 
Exsuspendisse ac rhoncus nisl, eu 
'''),
      ],
    );
  }
}
