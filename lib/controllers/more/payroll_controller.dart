import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class PayRollController extends GetxController {
  List<Map<String, dynamic>> files = []; // List to store file details
  Map<String, double> uploadProgress = {}; // Map to track progress of each file

  Future<void> pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf'], // Restrict to PDFs only
    );

    if (result != null) {
      for (var file in result.files) {
        if (!files.any((f) => f['name'] == file.name)) {
          files.add({
            'name': file.name,
            'size': file.size,
            'path': file.path,
            'progress': 0.0, // Initialize progress for each file
          });
          uploadProgress[file.name] = 0.0; // Add to progress map
          simulateUpload(file.name); // Start upload for the new file
        }
        update();
      }
    }
  }

  void simulateUpload(String fileName) async {
    for (int i = 1; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 50));
      uploadProgress[fileName] = i / 100; // Update progress
      files = files.map((file) {
        if (file['name'] == fileName) {
          file['progress'] = uploadProgress[fileName];
        }
        return file;
      }).toList();
      update();
    }
  }

  void removeFile(String fileName) {
    files.removeWhere((file) => file['name'] == fileName);
    uploadProgress.remove(fileName);
    update();
  }
}
