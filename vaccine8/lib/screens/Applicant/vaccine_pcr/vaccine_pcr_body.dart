import 'package:flutter/material.dart';
import 'package:vaccine8/app/colors.dart';
import 'package:vaccine8/components/constants/const.dart';

class Body extends StatelessWidget {
  String str1, str2;
  Body(this.str1, this.str2);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _cliprect(),
        // Center(
        Container(
          decoration: BoxDecoration(color: bacColor),
          padding: EdgeInsets.only(top: 200),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 46,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, pcrRoute);
                  },
                  child: Text(
                    str1,
                    style: TextStyle(fontSize: 28),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: iconColor, // background
                    onPrimary: Colors.white, // foreground
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 46,
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    str2,
                    style: TextStyle(fontSize: 28),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: iconColor, // background
                    onPrimary: Colors.white, // foreground
                  ),
                ),
              ),
            ],
          ),
        ),
        // ),
      ],
    );
  }
}

class _cliprect extends StatelessWidget {
  const _cliprect({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
        child: Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 21.0, left: 25),
        child: Text('PCR and Vaccine',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(24, 20, 97, 1))),
      ),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.8),
            spreadRadius: 5,
            blurRadius: 1,
            // offset: Offset(4, 4),
          )
        ],
        color: Colors.white,
      ),
    ));
  }
}
