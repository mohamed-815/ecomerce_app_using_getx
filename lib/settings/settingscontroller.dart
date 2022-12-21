import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class SettingsController extends GetxController {
  String? webimage;
  String? imagepath;
  UploadTask? task;
  getImage({required ImageSource source}) async {
    final image = await ImagePicker().pickImage(source: source);
    File file = File(image!.path);
    if (file != null) {
      imagepath = (image.path);
      final filename = basename(file.path);
      final destination = 'files/$filename';
      task = FireBaseApi.uplaodFile(destination, file);
      if (task == null) return;
      final snapshot = await task!.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      //AddingtoImageList(urlDownload);
      webimage = urlDownload;
      update();
    } else {
      return null;
    }
  }
}

class FireBaseApi {
  static UploadTask? uplaodFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
