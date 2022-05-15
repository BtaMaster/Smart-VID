import 'dart:io';
import 'package:file_picker/file_picker.dart';


class AWSStorageRepository {
  void uploadImage() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result == null) {
    print('No file selected');
    return;
    }

  // Upload file with its filename as the key
  final platformFile = result.files.single;
  final path = platformFile.path!;
  final key = platformFile.name;
  final file = File(path);
  try {
    final UploadFileResult result =
        await Amplify.Storage.uploadFile(
          local: file, 
          key: key
          onProgress: (progress) {
            print("Fraction completed: " + progress.getFractionCompleted().toString());
          }
        );
    print('Successfully uploaded file: ${result.key}');
  } on StorageException catch (e) {
    print('Error uploading file: $e');
  }
  }

  void getUserPfp() async {

  }
}