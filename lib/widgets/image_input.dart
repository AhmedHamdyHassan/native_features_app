import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  final Function getImage;
  ImageInput(this.getImage);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File image;

  Future<void> _imageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.getImage(source: ImageSource.camera, maxWidth: 600);
    if (pickedFile == null) {
      return;
    }
    setState(() {
      image = File(pickedFile.path);
    });
    widget.getImage(image);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
          width: 150,
          height: 100,
          alignment: Alignment.center,
          child: image != null
              ? Image.file(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'No image taken',
                  textAlign: TextAlign.center,
                ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: FlatButton.icon(
          onPressed: _imageFromCamera,
          icon: Icon(Icons.camera),
          label: Text('Take picture',
              style: TextStyle(fontWeight: FontWeight.bold)),
          textColor: Theme.of(context).primaryColor,
        ))
      ],
    );
  }
}
