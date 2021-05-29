import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'package:vaccine8/components/widgets/card_items.dart';
import 'package:vaccine8/components/widgets/center_card.dart';
import 'package:vaccine8/components/widgets/custom_clipper.dart';
import 'package:vaccine8/models/Centers.dart';
import 'package:vaccine8/models/mock_data.dart';

class Body extends StatelessWidget {
  List<Centers> centers;
  Body(this.centers);
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
                      "Centers List",
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
            Expanded(
              child: SizedBox(
                child: Container(
                  padding: EdgeInsets.only(top: 120),
                  child: ListView.separated(
                    itemCount: centers.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, pcrAppointmentRoute,
                            arguments: centers[index]),
                        child: CenterCard(
                          image: Image.asset(centers[index].imgRout),
                          title: centers[index].name,
                          value: "750",
                          unit: "km",
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        Divider(color: Colors.white.withOpacity(.8)),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
