import 'package:fifthapp/screens/add_place_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("your places"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              })
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatePlace>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapShot) => snapShot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatePlace>(
                child: const Center(
                  child: Text("got no places yet,start addding some "),
                ),
                builder: (ctx, greatePlace, ch) => greatePlace.items.length <= 0
                    ? ch!
                    : ListView.builder(
                        itemCount: greatePlace.items.length,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                FileImage(greatePlace.items[i].image),
                          ),
                          title: Text(greatePlace.items[i].title),
                          onTap: () {},
                        ),
                      ),
              ),
      ),
    );
  }
}
