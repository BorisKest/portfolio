import 'package:flutter/material.dart';
import 'package:portfolio/src/common/widgets/drawer.dart';
import 'package:portfolio/src/common/widgets/standart_card_builder.dart';
import 'package:portfolio/src/settings/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool themeBool = true;
  Icon themeIcon = const Icon(Icons.dark_mode_sharp);

  @override
  Widget build(BuildContext context) {
    var sideSpace = MediaQuery.of(context).size.width / 7;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(left: 30),
          child: const Text('Boris Kastner'),
        ),
        actions: [
          IconButton(
            onPressed: (() {
              setState(() {
                if (themeBool == true) {
                  themeIcon = const Icon(Icons.light_mode);
                  themeBool = !themeBool;
                } else {
                  themeIcon = const Icon(Icons.dark_mode);
                  themeBool = !themeBool;
                }
              });
              Settings().setTheme(themeBool);
            }),
            icon: themeIcon,
            padding: const EdgeInsets.only(right: 30),
          ),
        ],
      ),
      body: Container(
        color: Theme.of(context).secondaryHeaderColor,
        margin: EdgeInsets.only(left: sideSpace, top: 30, right: sideSpace),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: const <Widget>[
              Text(
                'Projects',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Nuitro',
                ),
                textAlign: TextAlign.start,
              ),
              BuildCard(
                titleText: 'Guide app',
                bodyText:
                    """   This app was developed for the park and serves as a map and guide in the park. It helps visitors navigate around the park and provides information about plants, trees, and animals. The paper map has been replaced by an interactive map with active geolocation, instead of large signs with lots of text there is now a small QR code that does not disturb the natural beauty, in the application the user can scan the code and view information about the plant or object of interest.
                      This application used the following: povider - With the help of a provider was implemented functionality to change the theme of the application and the language.
                      SQLite - To work with data more conveniently, SQLite was implemented. This will help to append/change/delete data in a more convenient format in the future.
                      location - For navigation, the third party library flutter_map was used. With it, the application displays the data from the OpenStreetMap server.
                      localization - At the moment the application was translated into 6 languages. This is necessary for a better user experience, since park visitors often come from other countries.
                      """,
                image: 'assets/images/grenaApp.jpg',
              ),
            ],
          ),
        ),
      ),
      drawer: const DrawerCreate(),
    );
  }
}
