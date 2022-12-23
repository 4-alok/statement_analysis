import 'package:file_picker/file_picker.dart';

Future<String> get csvFilePicker async => await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv', "CSV"],
    ).then(
      (result) => (result != null)
          ? result.files.first.path ?? ""
          : throw "No file selected",
    );
