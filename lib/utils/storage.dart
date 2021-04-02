import 'dart:io';
import 'dart:developer' as developer;

import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:file_picker/file_picker.dart';

void uploadFile({int userId:1}) async {
  // use a file selection mechanism of your choice
  List<File> files;
  FilePickerResult pickedFiles = await _pickFiles();

  if(pickedFiles != null) {
    files = pickedFiles.paths.map((path) => File(path)).toList();
  } else {
    // User canceled the picker
  }
  await _sendToS3(files, userId);
  listFiles();
}
