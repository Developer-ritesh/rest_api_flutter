import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FileUploadWidget extends StatefulWidget {
  @override
  _FileUploadWidgetState createState() => _FileUploadWidgetState();
}

class _FileUploadWidgetState extends State<FileUploadWidget> {
  String uploadMessage = '';
  String uploadedFolderPath = '';

  Future<void> uploadFile(XFile file) async {
    try {
      Dio dio = Dio();
      FormData formData = FormData.fromMap({
        'uploadfile': await MultipartFile.fromFile(file.path),
      });

      Response response = await dio.post(
        'https://biharigraphic.wuaze.com/graphio/imgapi.php',
        data: formData,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        print('--> upload success');
      } else {
        print('--> upload failed');
      }

      print('--> statusCode: ${response.statusCode}');
      print('--> body: ${response.data}');
    } catch (e) {
      print('----llll.  $e');
    }
  }

  void _selectImage() async {
    final picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      await uploadFile(pickedFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _selectImage,
              child: Text('Choose Image'),
            ),
            SizedBox(height: 20),
            Text(uploadMessage),
            SizedBox(height: 20),
            if (uploadedFolderPath.isNotEmpty)
              Text('Uploaded Folder Path: $uploadedFolderPath'),
          ],
        ),
      ),
    );
  }
}
