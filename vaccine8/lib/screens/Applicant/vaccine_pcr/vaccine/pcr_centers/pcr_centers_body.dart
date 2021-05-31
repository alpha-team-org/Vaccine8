import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vaccine8/components/widgets/center_card.dart';
import 'package:vaccine8/components/widgets/custom_clipper.dart';
import 'package:vaccine8/models/Centers.dart';
import 'package:vaccine8/models/Patient.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/pcr/pick_appontment/pick_ppointment.dart';

class Body extends StatefulWidget {
  Patient patient;
  List<Centers> centers;
  Body(this.centers, {@required this.patient});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void _navigate(int index) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                PickAppointmentScreen(widget.centers[index], widget.patient)));
    // Navigator.pushNamed(context, pcrAppointmentRoute,
    // arguments: widget.centers[index], Patient.copy(widget.patient) );

    if (result != null) {
      setState(() => widget.patient = result);
    }
  }

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
                      onTap: () => Navigator.pop(context, widget.patient),
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
                    itemCount: widget.centers.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _navigate(index);
                          setState(() {
                            widget.patient.pcrCenter =
                                widget.centers[index].name;
                          });
                        },
                        child: CenterCard(
                          image: Image.asset(widget.centers[index].imgRout),
                          title: widget.centers[index].name,
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
