// This will cover the file handling in Dart
import 'dart:io';


void deleteFile(String path) {
  final file = File(path);
  if (file.existsSync()) {
    file.deleteSync();
    print('File deleted: $path');
  } else {
    print('File not found: $path');
  }
}
void main() {
  // Specify the file path (use raw string to avoid escape character issues)
  var filePath = r'D:\Projects\dartPractices\sample.txt';

  // Create File object
  File file = File(filePath);

  // Get file metadata
  print('File path: ${file.path}');
  print('File absolute path: ${file.absolute.path}');
  print('File size: ${file.lengthSync()} bytes');
  print('Last modified: ${file.lastModifiedSync()}');

  // Read from the file
  try {
    String contents = file.readAsStringSync();
    print('File Contents:');
    print(contents);
  } catch (e) {
    print('Error reading file: $e');
  }

  deleteFile(filePath); // Uncomment this line to delete the file
  // Write to the file (append mode)
  try {
    String dataToWrite = 'Hello, Dart File Handling!\n';
    file.writeAsStringSync(dataToWrite, mode: FileMode.append);
    print('Data written to file successfully.');
  } catch (e) {
    print('Error writing to file: $e');
  }
}

// Note: Make sure the file path is correct and you have the necessary permissions to read/write the file.
