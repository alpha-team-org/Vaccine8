import 'package:flutter/material.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  Widget build(BuildContext context) {
    return AppBar(
      // toolbarHeight: 100,
      backgroundColor: Colors.white,
      leading: Icon(
        Icons.menu,
        color: Colors.black,
      ),
      title: Column(
        children: [
          Image.asset(
            'assets/icon.png',
            width: 30,
            fit: BoxFit.fill,
          ),
          Text(
            'Vaccine8',
            style:
                TextStyle(color: Color.fromRGBO(42, 42, 192, 1), fontSize: 20),
          )
        ],
      ),
      centerTitle: true,
      actions: [
        Icon(
          Icons.account_circle_outlined,
          size: 36,
        )
      ],
      elevation: 0,
    );
  }
}
