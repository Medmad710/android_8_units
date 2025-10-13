import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoViewerPage extends StatefulWidget {
  @override
  _PhotoViewerPageState createState() => _PhotoViewerPageState();
}

class _PhotoViewerPageState extends State<PhotoViewerPage> {
  File? _image;
  double _rotation = 0;
  bool _grayscale = false;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _rotation = 0;
        _grayscale = false;
      });
    }
  }

  void _rotate() {
    setState(() {
      _rotation += pi / 2; 
    });
  }

  void _toggleGrayscale() {
    setState(() {
      _grayscale = !_grayscale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Photo Viewer")),
      body: Center(
        child: _image == null
            ? Text("Выберите фото из галереи")
            : Transform.rotate(
                angle: _rotation,
                child: ColorFiltered(
                  colorFilter: _grayscale
                      ? ColorFilter.mode(Colors.grey, BlendMode.saturation)
                      : ColorFilter.mode(Colors.transparent, BlendMode.multiply),
                  child: Image.file(_image!),
                ),
              ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "pick",
            onPressed: _pickImage,
            child: Icon(Icons.photo),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "rotate",
            onPressed: _rotate,
            child: Icon(Icons.rotate_right),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "filter",
            onPressed: _toggleGrayscale,
            child: Icon(Icons.filter_b_and_w),
          ),
        ],
      ),
    );
  }
}
