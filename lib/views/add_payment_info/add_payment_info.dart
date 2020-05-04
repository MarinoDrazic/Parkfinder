import 'package:flutter/material.dart';
import 'package:parkfinder/views/add_payment_info/add_payment_info_viewmodel.dart';
import 'package:provider/provider.dart';

class AddPaymentInfo extends StatelessWidget {
  const AddPaymentInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<AddPaymentInfoViewModel>.value(
        value: AddPaymentInfoViewModel(),
        child:
            Consumer<AddPaymentInfoViewModel>(builder: (context, model, child) {
          return SingleChildScrollView();
        }),
      ),
    ));
  }
}
