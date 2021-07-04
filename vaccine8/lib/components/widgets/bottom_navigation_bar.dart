import 'package:flutter/material.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'package:vaccine8/components/widgets/bottom_icon.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
                onPressed: () => Navigator.pushNamed(context, dashboardRoute),
                icon: Icons.home_outlined,
                iconText: "Home",
              ),
              BottomIcon(
                onPressed: () {},
                icon: Icons.calendar_today_outlined,
                iconText: "Appointments",
              ),
              BottomIcon(
                onPressed: () {},
                icon: Icons.grid_view,
                iconText: "Services",
              ),
              BottomIcon(
                onPressed: () {},
                icon: Icons.account_circle_outlined,
                iconText: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
