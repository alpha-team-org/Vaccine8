import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vaccine8/app/colors.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'package:vaccine8/components/widgets/card_items.dart';
import 'package:vaccine8/components/widgets/card_main.dart';
import 'package:vaccine8/components/widgets/card_section.dart';
import 'package:vaccine8/components/widgets/custom_clipper.dart';

class Body extends StatelessWidget {
  String str1, str2;
  Body(this.str1, this.str2);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: MyCustomClipper(clipType: ClipType.bottom),
          child: Container(
            color: Color.fromRGBO(42, 42, 192, .7),
            height: 100.5 + statusBarHeight,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 30.0, bottom: 30, top: 20),
          child: ListView(
            children: <Widget>[
              // Header - Greetings and Avatar
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 80),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        FontAwesomeIcons.chevronLeft,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "COVID-19 Test",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 300, left: 15),
              child: MainCard(
                title: 'OMAR',
                icon: Icon(
                  FontAwesomeIcons.userAlt,
                  size: 28,
                ),
                color: Colors.white,
              ),
            ),
          ],
        ),
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
        child: Text('Vaccine',
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

// Column(
//       children: [
//         _cliprect(),
//         // Center(
//         Container(
//           decoration: BoxDecoration(color: bacColor),
//           padding: EdgeInsets.only(top: 200),
//           child: Column(
//             children: <Widget>[
//               Container(
//                 width: double.infinity,
//                 height: 46,
//                 margin: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, centersRoute);
//                   },
//                   child: Text(
//                     str1,
//                     style: TextStyle(fontSize: 28),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: iconColor, // background
//                     onPrimary: Colors.white, // foreground
//                   ),
//                 ),
//               ),
//               Container(
//                 width: double.infinity,
//                 height: 46,
//                 margin: EdgeInsets.symmetric(horizontal: 15),
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: Text(
//                     str2,
//                     style: TextStyle(fontSize: 28),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: iconColor, // background
//                     onPrimary: Colors.white, // foreground
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         // ),
//       ],
//     );
