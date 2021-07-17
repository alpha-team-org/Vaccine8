import 'package:flutter/material.dart';
import 'dart:core';
import 'package:mdi/mdi.dart';
import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/screens/login/login_screen.dart';
import 'package:vaccine8/screens/login/login_viewmodel.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(
              "assets/app_logo.png",
              fit: BoxFit.fitHeight,
            ),
            ListTile(
                dense: true,
                leading: Icon(Mdi.faceProfile, size: 30),
                title: Text("Profile"),
                subtitle: Text("Edit Profile"),
                onTap: () {}),
            ListTile(
                dense: true,
                leading: Icon(Mdi.phoneSettings, size: 30),
                title: Text("Contact Us"),
                subtitle: Text("Contact Info"),
                onTap: () => Navigator.pushNamed(context, "/contactUs")),
            ListTile(
              dense: true,
              leading: Icon(Icons.settings, size: 30),
              title: Text("App Settings"),
              subtitle: Text("Change App Settings"),
              onTap: () {},
            ),
            ListTile(
                dense: true,
                leading: Icon(Icons.info_outline, size: 30),
                title: Text("About us"),
                onTap: () => Navigator.pushNamed(context, "/aboutUs")),
            ListTile(
                dense: true,
                leading: Icon(Icons.logout, size: 30),
                title: Text("Log Out"),
                onTap: () {
                  dependency<LoginViewmodel>().user = null;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
