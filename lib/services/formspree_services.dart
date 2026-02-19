import 'dart:io';

import 'package:http/http.dart' as http;

class FormspreeService {
  static Future<bool> submitForm({
    required String endpoint,
    required Map<String, String> fields,
    File? file,
  }) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse(endpoint));

      request.headers['Accept'] = 'application/json';
      request.fields.addAll(fields);

      if (file != null) {
        request.files.add(await http.MultipartFile.fromPath('file', file.path));
      }

      final response = await request.send();

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
