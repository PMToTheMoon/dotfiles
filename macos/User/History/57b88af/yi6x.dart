import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zanalys/auth/auth.dart';
import 'package:zanalys/upload_document/upload_document.dart';

import 'picture_take_photo.dart';

class PicturePage extends StatefulWidget {
  const PicturePage({
    super.key,
  });

  @override
  PicturePageState createState() => PicturePageState();
}

class PicturePageState extends State<PicturePage> {
  PicturePageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const PaddingPageMedium(),
        child: Column(
          children: [
            const SizedBox(height: 40),
            PictureTakePhoto(
              onTap: () => UploadDocumentPage.open(context),
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
            ),
          ],
        ),
      ),
    );
  }
}
