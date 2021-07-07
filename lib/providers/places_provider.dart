import 'dart:io';

import 'package:flutter/foundation.dart';
import '../helpers/db_helper.dart';
import '../models/place.dart';

class PlacesProvider extends ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    final place = Place(
        id: DateTime.now().toString(),
        image: image,
        title: title,
        location: null);
    _items.add(place);
    notifyListeners();
    DBHelper.insert('user_places',
        {'id': place.id, 'title': place.title, 'image': place.image.path});
  }

  Future<void> fatchData() async {
    final data = await DBHelper.getData('user_places');
    _items = data
        .map((e) => Place(
            id: e['id'],
            image: File(e['image']),
            title: e['title'],
            location: null))
        .toList();
    notifyListeners();
  }
}
