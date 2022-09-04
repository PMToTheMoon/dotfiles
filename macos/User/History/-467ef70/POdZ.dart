import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:neat/neat.dart';

import 'package:common/common.dart';
import 'package:zanalys/auth/auth.dart';

import 'package:zanalys/upload_document/upload_document.dart';

import 'home_take_photo.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  Future _onTakePhoto(BuildContext context) async {
    await UploadDocumentPage.open(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          HomeTakePhoto(
            onTap: () => _onTakePhoto(context),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => UploadDocumentPage.open(
                  context, UploadDocumentScreenArgs(accessCode: "17289")),
              child: const Text('to upload doc'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: GetIt.I.get<AuthService>().logout,
              child: const Text('logout'),
            ),
          )
        ],
      ),
    );
  }
}
