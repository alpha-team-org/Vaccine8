import 'package:flutter/material.dart';
import 'package:vaccine8/models/Centers.dart';
import 'package:vaccine8/models/mock_data.dart';

class Body extends StatelessWidget {
   List<Centers>centers;
    Body(this.centers) ;
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        ClipRect(
            child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 21.0, left: 25),
            child: Text('Centers List',
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
        Expanded(
          child: SizedBox(
            child: Container(
              padding: EdgeInsets.only(top:40),
              child: ListView.separated(
                itemCount: centers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(centers[index].name),
                    leading: Image.asset(centers[index].imgRout),
                    onTap: () {
                      Navigator.pushNamed(context, '/vacapp',arguments: centers[index]);
                    },
                  );
                },
                separatorBuilder: (context, index) => Divider(
                color:Colors.black.withOpacity(.8)
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
