import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:huawei_test/db/dbHelper.dart';
import 'package:huawei_test/models/payment.dart';
import 'package:huawei_test/screens/home_page.dart';

class Payment_entry extends StatefulWidget {
  @override
  _Payment_entryState createState() => _Payment_entryState();
}

class _Payment_entryState extends State<Payment_entry> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  final format = new DateFormat('yyyy-MM-dd hh:mm');

  TextEditingController productInput = new TextEditingController();
  TextEditingController priceInput = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              autovalidate: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: productInput,
                    decoration: new InputDecoration(
                        labelText: 'Ürün',
                        labelStyle: TextStyle(color: Colors.lightGreenAccent)),
                    keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                    controller: priceInput,
                    decoration: new InputDecoration(
                        labelText: 'Fiyat',
                        labelStyle: TextStyle(color: Colors.lightGreenAccent)),
                    keyboardType: TextInputType.text,
                  ),
                  Padding(padding: const EdgeInsets.only(top: 30.0)),
                  SizedBox(
                    width: 400.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: _payment,
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 30.0),
                      ),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _payment() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    var paymnetModel = new PaymentModel(
        ID: null, PRODUCT_NAME: null, PRICE: null, RECORD_DATE: null);
    paymnetModel.PRODUCT_NAME = productInput.text.toString();
    paymnetModel.PRICE = priceInput.text.toString();
    paymnetModel.RECORD_DATE = format.format(new DateTime.now().toLocal());
    var dbHelper = new DbHelper();
    dbHelper.insertNewPayment(paymnetModel);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));

    //aterialPageRoute(builder: (context) => Payment_entry()));
  }
}
