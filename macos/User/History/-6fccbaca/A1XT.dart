import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

import 'package:common/common.dart';

import 'package:zanalys/app/app_services.dart';
import 'package:zanalys/home/ui/components/home_take_photo.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          Row(
            children: [
              Text(
                context.l10n.home_title,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: context.colorScheme.onSurface,
                ),
              ),
              const SizedBox(width: 5),
              const Text(
                '👋',
                style: TextStyle(fontSize: 26),
              )
            ],
          ),
          const SizedBox(height: 40),
          HomeTakePhoto(
            onTap: () => AppServices.navigation.toDocumentUpload(),
          ),
        ],
      ),
    );
  }
}
