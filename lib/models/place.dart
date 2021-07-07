import 'package:flutter/foundation.dart';
import 'dart:io';

class PlaceLocation {
  final double latitude, longtude;
  final String address;
  PlaceLocation(
      {@required this.latitude, @required this.longtude, this.address});
}

class Place {
  final String id, title;
  final File image;
  final PlaceLocation location;
  Place(
      {@required this.id,
      @required this.image,
      @required this.title,
      @required this.location});
}
