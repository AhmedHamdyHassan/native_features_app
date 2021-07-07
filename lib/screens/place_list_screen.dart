import 'package:flutter/material.dart';
import '../providers/places_provider.dart';
import 'package:provider/provider.dart';
import '../screens/add_place_screen.dart';

class PlaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Place'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
                })
          ],
        ),
        body: FutureBuilder(
          future:
              Provider.of<PlacesProvider>(context, listen: false).fatchData(),
          builder: (ctx, connectionData) => connectionData.connectionState ==
                  ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<PlacesProvider>(
                  child: Center(
                    child: Text(
                      'No places yet,Start adding some!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  builder: (ctx, placesProviderValue, ch) =>
                      placesProviderValue.items.length <= 0
                          ? ch
                          : ListView.builder(
                              itemCount: placesProviderValue.items.length,
                              itemBuilder: (ctx, i) => Card(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: FileImage(
                                            placesProviderValue.items[i].image),
                                      ),
                                      title: Text(
                                          placesProviderValue.items[i].title),
                                    ),
                                  )),
                ),
        ));
  }
}
