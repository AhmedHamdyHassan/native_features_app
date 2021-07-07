const GOOGLE_API_KEY = 'AIzaSyBg9yn5JtQgKRFbg6FCTy4ewbF24kRuAYI';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double latitude, double longtude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longtude&zoom=16&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:C%7C$latitude,$longtude&key=$GOOGLE_API_KEY';
  }
}
