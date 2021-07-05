import 'package:flutter/material.dart';
import 'package:vaccine8/app/colors.dart';
import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/screens/JdJk/symptoms/symptoms_viewmodel.dart';
import 'package:vaccine8/screens/JdJk/symptoms/widget/body_view.dart';

import '../../view.dart';

class SymptomsScreem extends StatefulWidget {

  @override
  _SymptomsScreemState createState() => _SymptomsScreemState();
}

class _SymptomsScreemState extends State<SymptomsScreem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bacColor,
      //   appBar: AppBar(
      //       backgroundColor: Color.fromRGBO(42, 42, 192, .7),
      //       title: const Text("Monitoring"), actions: <Widget>[
      //   CircleAvatar(
      //     backgroundImage: AssetImage('assets/profile_picture.png'),
      //   ),
      // ]),


body :ConsumerView<SymptomsViewmodel>(
  initViewmodel: (viewmodel)=>dependency<SymptomsViewmodel>(),
  builder: (context,viewmodel,___)=>Body(viewmodel)),


    );
  }
}