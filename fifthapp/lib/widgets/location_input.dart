import 'dart:ffi';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location/location.dart';

import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final LocData = await Location().getLocation();
    print(LocData.latitude);
    print(LocData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 170,
            width: double.infinity,
            alignment: Alignment.center,
            child: _previewImageUrl == null
                ? Text(
                    "no location choosen",
                    textAlign: TextAlign.center,
                  )
                : Image.network(
                    _previewImageUrl as String,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )),
        Row(
          children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.location_on),
              label: Text("current location"),
              onPressed: _getCurrentUserLocation,
            ),
            TextButton.icon(
              icon: Icon(Icons.map),
              label: Text("selection map"),
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }
}
