import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRect(
            child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 21.0, left: 25),
            child: Text('Dashboard',
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
        )),
        Container(
          padding: const EdgeInsets.only(top:20,left:10,right:10),
          
          height: 621.4,
          decoration: BoxDecoration(color: Color.fromRGBO(236, 241, 250, 1)),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            primary: false,
            crossAxisSpacing: 19j,
            children: <Widget>[
              Container(
                // padding :const EdgeInsets.only(top:10),
                
                child: SizedBox(
                  height: 600,
                  child: Card(
                    
                    child: Column(children: <Widget>[
                      
                    //   Padding(
                    //     padding: const EdgeInsets.only(top:20.0),
                    //     child: Text("Pcr && Vaccine",
                    //     style: TextStyle(color: Color.fromRGBO(24, 20, 97, 1),
                    //     fontSize: 20 ,fontWeight: FontWeight.bold),),
                    //   ),
                    //   Padding(
                    //     padding: const EdgeInsets.only(top:10.0),
                    //     child: Icon(Icons.assignment_sharp,
                    //     size:120,
                    //  color: Color.fromRGBO(42, 42, 192, .7)),
                    //   )



                    ],),
                  ),
                
                ),
                
              ),
              Card(),
              Card(),
              Card(),
            ],
          ),
        ),
      ],
    );
  }
}
