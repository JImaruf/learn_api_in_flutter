import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});
  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future<void> getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      print("no Image Selected");
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      showSpinner = true;
    });
    var stream = new http.ByteStream(image!.openRead());
    stream.cast();
    var length = await image!.length();
    var uri = Uri.parse("https://fakestoreapi.com/products");
    var request = new http.MultipartRequest("POST", uri);
    request.fields["title"] = "Static title";
    var multipart = http.MultipartFile('image', stream, length);
    request.files.add(multipart);

    var response = await request.send();
    if (response.statusCode == 200) {
      setState(() {
        showSpinner = false;
      });
      print("upload success");
    } else {
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text("|Upload Image|"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  getImage();
                },
                child: Container(
                  width: 100,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      border: Border.all(color: Colors.blue)),
                  child: image == null
                      ? Center(
                          child: Text("Pick a Image"),
                        )
                      : Container(
                          child: Center(
                          child: Image.file(
                            File(image!.path).absolute,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        )),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    uploadImage();
                  },
                  child: Text("upload Image"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
