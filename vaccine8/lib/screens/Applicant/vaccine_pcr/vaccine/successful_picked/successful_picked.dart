import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vaccine8/app/colors.dart';
import 'package:vaccine8/components/widgets/bar.dart';

class SuccessfullPickedVaccineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(bacColor),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: BoxDecoration(color: bacColor),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: Colors.green,
                    size: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("Appointment Confirmend!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  // padding: EdgeInsets.symmetric(vertical:10),
                  height: 60,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                          style: new TextStyle(
                            fontSize: 28.0,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(text: "Thu , 09 Apr"),
                            TextSpan(
                                text: "  08:00",
                                style: TextStyle(color: Colors.green))
                          ]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text("first dose",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  children: [
                    Icon(Icons.location_on, size: 30, color: Colors.grey),
                    Text(
                      "skudai hospital",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Divider(color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/subm.png',
                      width: 300,
                      height: 200,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 19),
                width: double.infinity,
                height: 70,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                // margin: EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/succPicked');
                  },
                  child: Text(
                    "Appointments",
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.normal),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: iconColor, // background
                    onPrimary: Colors.white, // foreground
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
