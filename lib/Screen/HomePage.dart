import 'dart:async';
import 'dart:io';
//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:file/file.dart';
import 'package:tflite/tflite.dart';

class HomePage extends StatefulWidget {
  //const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// var valueChoose;
// List year = ["2024", "2023", "2022", "2021", "2020"];
// List brand = ["Ford", "Hyundai", "Honda"];
// List model = ["Endeavour", "Figo", "Fiesta"];
// List variant = ["Petrol", "Disel", "Hybird", "CNG"];
// List location = ["Chennai", "Bengalaru", "Hyerabad"];
// List ownership = ["1", "2", "3", "4", "5"];
// List condition = ["Good", "Average", "Bad"];

class _HomePageState extends State<HomePage> {
  List? _outputs;
  File? _image;
  //final _picker = ImagePicker();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crop Disease Classifier'),
      ),
      body: _loading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _image == null ? Container() : Image.file(_image!),
                  SizedBox(
                    height: 20,
                  ),
                  _outputs != null
                      ? Text(
                          "${_outputs![0]["label"]}"
                              .replaceAll(RegExp(r'(0-9)'), ''),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            background: Paint()..color = Colors.white,
                          ),
                        )
                      : Container()
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: Icon(Icons.image),
      ),
    );
  }

  getImage() async {
    ImagePicker _picker = ImagePicker();
    var pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    //print(pickedFile);
    if (pickedFile == null) return null;
    setState(() {
      _loading = true;
      _image = File(pickedFile.path);
    });
    classifyImage(_image!);
    //print(_image!);
  }

  classifyImage(File _image) async {
    var output = await Tflite.runModelOnImage(
      path: _image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      _outputs = output!;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
