import 'package:flutter/material.dart';
import '../medicine_viewmodel.dart';

class Float extends StatelessWidget {
  final MedicineViewmodel viemodel;
  Float(this.viemodel);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          backgroundColor: Colors.purple[700],
          tooltip: 'Add a new todo',
          child: Icon(Icons.add),
          heroTag: null,
          onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) =>
                _buildPopupDialog(context, viemodel),
          ),
        ),
      ],
    );
  }
}

Widget _buildPopupDialog(BuildContext context, MedicineViewmodel viewmodel) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    elevation: 16,
    child: Container(
        height: 400.0,
        width: 360.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter new medicine',
              ),
              onChanged: (value) => viewmodel.medicin.name = value,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () =>
                          {viewmodel.addMedicine(), viewmodel.getMedicines()},
                      child: Text("Add")),
                  ElevatedButton(
                      onPressed: () => {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)),
                      child: Text("Cancel"))
                ],
              ),
            ),
          ],
        )),
  );
}
