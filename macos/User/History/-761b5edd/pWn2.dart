import 'package:common/common.dart';

import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

enum RequestType {
  teleExpertise,
  consultation,
}

class RequestCard extends StatelessWidget {
  const RequestCard({
    super.key,
  });

  String from;

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      backgroundColor: context.colorScheme.primaryContainer,
      child: Row(
        children: [
          Expanded(
            child: Text("Request"),
          ),
        ],
      ),
    );
  }
}
