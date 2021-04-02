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

Future _sendToS3(List<File> files, int userId) async {
  Map<String, String> metadata = <String, String>{};
  metadata['name'] = 'filename';
  metadata['desc'] = 'A test file';
  S3UploadFileOptions options = S3UploadFileOptions(accessLevel: StorageAccessLevel.guest, metadata: metadata);
  for(int i=0; i<files.length;i++){
    final file = files[i];
    String filename = file.path.split('/').last;
    developer.log('uploading '+ filename);
    try {
      UploadFileResult result = await Amplify.Storage.uploadFile(
          key: userId.toString() + '/'+ filename,
          local: file,
          options: options
      );
      print('finished uploading '+ filename);
    } on StorageException catch (e) {
      print(e.message);
    }
  }
}

Future<FilePickerResult> _pickFiles() async {
  FilePickerResult pickedFiles = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['jpg', 'png', 'gif'],
  );
  return pickedFiles;
}

void downloadFile(key) async {
  try {
    DownloadFileResult result = await Amplify.Storage.downloadFile(
        key: key,
        local: new File(key)
    );
  } on StorageException catch (e) {
    print(e.message);
  }
}

void listFiles() async{
  try {
    ListResult res = await Amplify.Storage.list();

    for (StorageItem item in res.items) {
      developer.log(
          'Item: { key:${item.key}, eTag:${item.eTag}, lastModified:${item.lastModified}, size:${item.size}');
    }
  } on StorageException catch (e) {
    print(e.message);
  }

}

void removeFile(key) async{
  try {
    RemoveResult res = await Amplify.Storage.remove(
      key: key,
    );
  } on StorageException catch (e) {
    print(e.message);
  }
}