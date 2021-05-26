import 'package:flutter/material.dart';
import 'package:vaccine8/app/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vaccine8/models/Appointment.dart';
import 'package:vaccine8/models/Centers.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {
  Centers centers;
  Body(this.centers);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(color: bacColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_rowfForImageNName(centers), buildCarouselSlider(), _Button()],
        ));
  }

  CarouselSlider buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(height: 155.0),
      items: centers.appointments.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.5),
                      offset: const Offset(
                        1.0,
                        1.0,
                      ),
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Row(children: [
                        Column(children: [
                          Text(DateFormat('yyyy-MM-dd').format(i.date),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22)),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 13.0),
                            child: Text("3 slots available",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey)),
                          )
                        ])
                      ]),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all()),
                                child: Text(
                                  "10",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all()),
                                child: Text(
                                  "12",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all()),
                                child: Text(
                                  "2".toString(),
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          },
        );
      }).toList(),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 19),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/succPicked');
        },
        child: Text(
          "Save",
          style: TextStyle(fontSize: 28),
        ),
        style: ElevatedButton.styleFrom(
          primary: iconColor, // background
          onPrimary: Colors.white, // foreground
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

class _rowfForImageNName extends StatelessWidget {
Centers centers;  
   _rowfForImageNName(
this.centers

  ) ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          centers.imgRout,
          width: 200,
          height: 250,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            "${centers.name} ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
