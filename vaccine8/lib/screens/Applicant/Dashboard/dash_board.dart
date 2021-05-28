import 'package:flutter/material.dart';
import 'package:vaccine8/components/widgets/bar.dart';
import 'package:vaccine8/components/widgets/bottom_icon.dart';
import 'package:vaccine8/screens/Applicant/Dashboard/body.dart';
import 'Drawer.dart';

class AppllicantDasboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      body: Body(),
      drawer: Draw(),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(42, 42, 192, .7),
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                BottomIcon(
                  onPressed: () {},
                  icon: Icons.home,
                  iconText: "Home",
                ),
                BottomIcon(
                  onPressed: () {},
                  icon: Icons.mail,
                  iconText: "Mail",
                ),
                BottomIcon(
                  onPressed: () {},
                  icon: Icons.map,
                  iconText: "Map",
                ),
                BottomIcon(
                  onPressed: () {},
                  icon: Icons.settings,
                  iconText: "Settings",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
