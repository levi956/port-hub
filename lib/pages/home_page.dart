import 'package:flutter/material.dart';
import 'package:port_hub/utils/styles/color_constants.dart';
import 'package:port_hub/utils/widgets/recent_contacts.dart';
import 'package:port_hub/utils/widgets/recent_messages.dart';

import '../services/database_methods.dart';
import '../utils/navigation/navigation.dart';
import '../utils/status_bar_color.dart';
import 'menu_page.dart';

class HomePage extends StatefulWidget {
  static const IconData menu = IconData(0xe3dc, fontFamily: 'MaterialIcons');
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  DatabaseMethods myDatabase = DatabaseMethods();

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.white);
    return Scaffold(
      backgroundColor: homeBlue,
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 45),
              child: Row(
                children: [
                  futureBuilder(myDatabase.getUserDetails()),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 25),
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                        color: white.withOpacity(0.3), shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {
                        pushTo(context, const Menu());
                      },
                      icon: const Icon(Icons.menu),
                      iconSize: 25,
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
            RecentContacts(),
            const RecentMessages(),
          ],
        ),
      ),
    );
  }

  FutureBuilder<dynamic> futureBuilder(Future<dynamic> futureName) {
    return FutureBuilder(
      future: futureName,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('an error has occured '),
            );
          } else if (snapshot.hasData) {
            final data = snapshot.data["firstName"];

            // final data = snapshot.data as String;
            return Text(
              "Chat with\nyour portals, $data",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w300, color: white),
            );
          }
        }
        return const CircularProgressIndicator.adaptive();
      },
    );
  }
}
