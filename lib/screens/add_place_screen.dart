import 'dart:io';

import 'package:flutter/material.dart';
import '../providers/places_provider.dart';
import '../widgets/image_input.dart';
import '../widgets/location_input.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const String routeName = '/Add_place_screen';
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final titleInputController = TextEditingController();
  File image;

  void _getImage(File img) {
    image = img;
  }

  void _savePlace() {
    if (titleInputController.text.isEmpty ||
        titleInputController.text == null ||
        image == null) {
      return;
    }
    Provider.of<PlacesProvider>(context, listen: false)
        .addPlace(titleInputController.text, image);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add new place',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: titleInputController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ImageInput(_getImage),
                  SizedBox(
                    height: 10,
                  ),
                  LocationInput(),
                ],
              ),
            ),
          )),
          FlatButton.icon(
            onPressed: _savePlace,
            icon: Icon(Icons.add),
            label: Text(
              'Add place',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            color: Theme.of(context).accentColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}
