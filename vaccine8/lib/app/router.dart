
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'dependcies.dart';
Route<dynamic> createRoute(RouteSettings settings){

switch(settings.name){

case '/dash_board':
  return MaterialPageRoute(builder: (context)=>AppllicantDasboardScreen());
  case '/&pcrvac':
  return MaterialPageRoute(builder: (context)=>VaccineAndPcrScreen());
  case '/vacboard':
    return MaterialPageRoute(builder: (context)=>VaccineBoardScreen());



}




}