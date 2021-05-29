import 'package:flutter/material.dart';
import 'package:vaccine8/app/colors.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: bacColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRect(
              child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 21.0, left: 25),
              child: Text('My Appointment',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(24, 20, 97, 1))),
            ),
            height: 200,
            width: double.infinity,
            // decoration: BoxDecoration(
            //   boxShadow: [
            //     BoxShadow(
            //       color: Colors.grey.withOpacity(.8),
            //       spreadRadius: 5,
            //       blurRadius: 1,
            //       // offset: Offset(4, 4),
            //     )
            //   ],
            //   color: bacColor,
            // ),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: Container(
              child: Text("Upcoming",
                  style: TextStyle(
                      color: iconColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Divider(color: Colors.grey[900]),
          Expanded(
            child: SizedBox(
              child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(color: Colors.grey[600]),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("09/09/2020",
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(.4))),
                        ),
                        subtitle: Text("First doze",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        onLongPress: () {});
                  }),
            ),
          )
        ],
      ),
    );
  }
}
