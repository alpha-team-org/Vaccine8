import 'package:flutter/material.dart';
import 'package:vaccine8/app/dependencies.dart';
import '../../view.dart';
import 'medicine_viewmodel.dart';
import 'widget/body_view.dart';
import 'widget/float_view.dart';

class MedicieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConsumerView<MedicineViewmodel>(
      initViewmodel: (viewmodel) =>
          dependency<MedicineViewmodel>().getMedicines(),
      builder: (context, viewmodel, __) => Scaffold(
        body: Body(viewmodel),
        floatingActionButton: Float(viewmodel),
      ),
    );
  }
}
