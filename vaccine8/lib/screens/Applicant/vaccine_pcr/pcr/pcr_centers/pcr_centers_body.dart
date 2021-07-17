import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'package:vaccine8/components/widgets/center_card.dart';
import 'package:vaccine8/components/widgets/custom_clipper.dart';
import 'package:vaccine8/models/Centers.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/pcr/pcr_centers/pcr_viewmodel.dart';

class Body extends StatefulWidget {
  List<Centers> centers;
  PcrViewModel viewmodel;
  Body(
      this.centers,
      // {@required this.patient}
      this.viewmodel);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // void _navigate(int index) async {
  //   final result = await Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) =>
  //               PickAppointmentScreen(widget.centers[index], widget.patient)));
  // Navigator.pushNamed(context, pcrAppointmentRoute,
  // arguments: widget.centers[index], Patient.copy(widget.patient) );

  // if (result != null) {
  //   setState(() => widget.patient = result);
  // }
  // }

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
                    itemCount: widget.centers.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          widget.viewmodel.index = index;
                          DatePicker.showDateTimePicker(
                            context,
                            showTitleActions: true,
                            onChanged: (date) {},
                            onConfirm: (date) {
                              widget.viewmodel.appointment.day = date;
                              widget.viewmodel.appointment.centerId =
                                  widget.viewmodel.center.name;
                              widget.viewmodel.appointment.type = "pcr";
                              widget.viewmodel.appointment.applicantId =
                                  widget.viewmodel.userId;
                              widget.viewmodel.addAppointment();
                              Navigator.pushNamed(context, pcrRoute);
                            },
                            minTime: DateTime.utc(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day + 1,
                                09,
                                00),
                            maxTime: DateTime.utc(
                                DateTime.now().year,
                                DateTime.now().month + 1,
                                DateTime.now().day,
                                20,
                                00),
                          );

                          setState(() {
                            // widget.patient.vaccineCenter =
                            //     widget.centers[index].name;
                          });
                        },
                        child: CenterCard(
                          image: Image.asset(widget.centers[index].imgRout),
                          title: widget.centers[index].name,
                          value: "10",
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
