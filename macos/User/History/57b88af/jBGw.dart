import 'package:flutter/material.dart';
import 'package:zanalys/upload_document/upload_document.dart';

import 'picture_take_photo.dart';

class Picture extends StatefulWidget {
  const Picture({
    super.key,
  });

  @override
  PictureState createState() => PictureState();
}

class PictureState extends State<Picture> {
  PictureState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
    );
  }
}
