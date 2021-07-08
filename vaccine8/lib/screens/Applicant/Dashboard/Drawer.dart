import 'package:flutter/material.dart';
import 'package:vaccine8/models/Patient.dart';
import 'package:vaccine8/models/mock_data.dart';

class Draw extends StatefulWidget {
  // Patient pateint = new Patient(
      // name: patientList[0].name,
      // photoUrl: patientList[0].photoUrl,
      // address: patientList[0].address);
  @override
  _DrawState createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: buildListView(),
    );
  }

  ListView buildListView() {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        buildDrawerHeader(),
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey.withOpacity(.5)))),
          child: GestureDetector(
            onTap: () {},
            child: buildListTile(),
          ),
        ),
      ],
    );
  }

  ListTile buildListTile() {
    return ListTile(
      leading: Icon(
        Icons.assessment_outlined,
        color: Color.fromRGBO(42, 42, 192, 1),
        size: 40,
      ),
      title: Text('Pcr && Vaccine',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(24, 20, 97, 1),
          )),
    );
  }

  DrawerHeader buildDrawerHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(color: Color.fromRGBO(236, 241, 250, 1)),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // Image.asset(
            // pateint.photoUrl,
          //   width: 80,
          //   height: 80,
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(pateint.name,
                //     style: TextStyle(
                //         color: Color.fromRGBO(42, 42, 192, 1),
                //         fontSize: 16,
                //         fontWeight: FontWeight.bold)),
                // Padding(
                //     padding: const EdgeInsets.only(top: 12.0),
                //     child: Text(pateint.address,
                //         style: TextStyle(fontFamily: 'Raleway'))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
