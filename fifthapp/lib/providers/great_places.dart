import 'dart:io';
import 'package:fifthapp/models/place.dart';
import 'package:flutter/foundation.dart';
import '../helpers/db_helpers.dart';

class GreatePlace with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: pickedTitle,
        //    location: null as PlaceLocation,
        image: pickedImage);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert("user_places", {
      "id": newPlace.id,
      "title": newPlace.title,
      "image": newPlace.image.path
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData("user_places");
    _items = dataList
        .map(
          (item) => Place(id: "id", title: "title", image: File(item["image"]),),
        )
        .toList();
    notifyListeners();
  }
}