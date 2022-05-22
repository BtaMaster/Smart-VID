import 'dart:ffi';
import 'dart:io';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:file_picker/file_picker.dart';
import 'package:smartvid/Resources/classes/aws_cognito.dart';
import 'package:path_provider/path_provider.dart';

final cognitoRepository = AWSCognitoRepository();

class AWSStorageRepository {
  Future<bool> uploadImage() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();
    var username = await cognitoRepository.getUser();
    if (result == null) {
      print('No file selected');
      return false;
    }

    // Upload file with its filename as the key
    final platformFile = result.files.single;
    final path = platformFile.path!;
    final key = username! + '/' + "pfp";
    final file = File(path);
    try {
      final UploadFileResult result = await Amplify.Storage.uploadFile(
          local: file,
          key: key,
          onProgress: (progress) {
            print("Fraction completed: " +
                progress.getFractionCompleted().toString());
          });
      print('Successfully uploaded file: ${result.key}');
      return true;
    } on StorageException catch (e) {
      print('Error uploading file: $e');
      return false;
    }
  }

  Future<bool> uploadDefaultPfp() async {
    return true;
  }

  void getUserPfp() async {
    try {
      final GetUrlResult result =
          await Amplify.Storage.getUrl(key: 'ExampleKey');
      // NOTE: This code is only for demonstration
      // Your debug console may truncate the printed url string
      print('Got URL: ${result.url}');
    } on StorageException catch (e) {
      print('Error getting download URL: $e');
    }
  }

  Future<String?> getPfpUrl() async {
    try {
      var username = await cognitoRepository.getUser();
      final GetUrlResult result =
          await Amplify.Storage.getUrl(key: username.toString() + '/pfp');
      // NOTE: This code is only for demonstration
      // Your debug console may truncate the printed url string
      print('Got URL: ${result.url}');
      // return result.url.toString();
      return result.url;
    } on StorageException catch (e) {
      print('Error getting download URL: $e');
      return "https://smartvid-storage01535-staging.s3.us-east-1.amazonaws.com/public/profiletemp.png?response-content-disposition=inline&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQC%2BVmOYqQ1EewDvk7JKX3rGV8qKzop%2FqNOPKPDdtOQmGQIhALFxSKOqz%2FxLPFlqptemorWwwRsTMuqUaCJe88yMrsoRKu0CCJT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMMDY3NTIwODgwMDEzIgy0rlnFlvMxJNgkatYqwQKPkONSzCnWtXJ55QnKZgWpXwND%2Bn0mF6TnTJngzz6IDVgB0q8wg5tufosxi7bxYYKpkVcaFAo%2FRq6UMkUR12NHYqHPFQRQsuRZXw5n0YXD%2FKB77bs5X529W1p4DZgUa688Gx3BoCF%2Fo5ZF%2Bnkog6iVNUO7DCaefj%2BpQNJ6CeAJ%2FCtffoDGqg08rbkk3Dnu%2BTBjV25GYLbtnSZV%2B9ygZDPb9C9eE3UsFA5DA6lKWOSkDucwaux8vI2ECJEsLdOJTyD%2Fu0Wp7mzSCagjcjhPyiiQAFmuEPYWsigvGRdQ0zHuPvEWYQZPykJWemLsZq3psTXyyuOa0sAxvBT5YrgfTy6TT0H3vw7eGl%2BXRgEBo7%2FDVwnj9LrcYT5BzVPoJfVOTDK3zxPvIKk7YrsUEcBvYWUCm4OTLa35eDVqX1q1crhazG0w75WFlAY6sgIImKyUAX19QBsx7obv2OH9itbbC3REXev%2BuI%2F%2F8ykqCPyZl2%2BjzTwi2sEixQ1%2Fwif8OLhseawwshf0R7TLVlyUVTelonHhIp9MhQj158lj%2BFLsH5YkfLt%2FI64Gfz7vGl04LFjc1%2Fz011bUz0CYKETFpwN9Wf97Ajvec65cIfnR1R8en4GZeWfZMtakteXvaJSX7zMjx4UkO%2B88w8cTPfzQMhwNtpw0BtkrvCGIEn9%2F9s%2BwNnAvv4ltMBVIFW3Al28iLsDwE%2Bxu6YCF9oYPcU25uVvnTyEpQBLZQn6TXVtsLAeomDxneEgErwVZPgERx%2FNlUiMqgi2jH2y2S54p%2Bt3CKnb4c6%2BrBtGaRSyqWRnI1TvkBHkczivlD2D0undsaVdDfz1VK5Pe7TFVxliZr3VeoMM%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20220515T191401Z&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Credential=ASIAQ7OEO3WGXPPNEIVO%2F20220515%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=0ffe3e11b766606865ec247cfccbc2a02a2fc806a49601ec97bdac0df21cb43a";
    }
  }

  Future<void> downloadFile() async {
    final documentsDir = await getApplicationDocumentsDirectory();
    var username = await cognitoRepository.getUser();
    final filepath = documentsDir.path;
    final file = File(filepath);

    try {
      await Amplify.Storage.downloadFile(
          key: username.toString() + '/pfp',
          local: file,
          onProgress: (progress) {
            print("Fraction completed: " +
                progress.getFractionCompleted().toString());
          });
      final String contents = file.readAsStringSync();
      print('Downloaded contents: $contents');
    } on StorageException catch (e) {
      print('Error downloading file: $e');
    }
  }
}
