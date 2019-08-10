import 'package:flutter/material.dart';
import 'package:vapestore/customwidgets/custominputfield.dart';
import 'package:vapestore/customwidgets/custominputfieldshort.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:vapestore/screens/list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'additem_page.dart';

class AddItemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddItemPage();
}

class _AddItemPage extends State<AddItemPage> {
  //Button color//
  bool pressAttention2 = false;
  bool pressAttention1 = false;
  bool pressAttention3 = false;
  bool pressAttention4 = false;
//oroperties//
  String _productType;
  int groupValue = 1;
  String _productName;
  String _localisation;
  double _price;
  int _number;
  String _description;
//connection
  final databaseReference =
      FirebaseDatabase.instance.reference().child("products");

      
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final myControllerProductName = TextEditingController();
  final myControllerLocalisation = TextEditingController();
  final myControllerPrice = TextEditingController();
  final myControllerNumber = TextEditingController();
  final myControllerProductType = TextEditingController();
  final myControllerDescription = TextEditingController();

  TextEditingController _emailFieldController;
  TextEditingController _passwordFieldController;
  TextEditingController _nicklFieldController;
//metody
  _changeState(int e) {
    setState(() {
      if (e == 1) {
        _productType = 'Set';
        groupValue = 1;
      } else if (e == 2) {
        _productType = 'Box';
        groupValue = 2;
      } else if (e == 3) {
        groupValue = 3;
        _productType = 'Atom';
      } else if (e == 4) {
        _productType = 'Liquid';
        groupValue = 4;
      }
    });
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Container(
                    width: 300.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/addproduct.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Column(
                    children: <Widget>[
                      CustomInputField(210, Icon(Icons.textsms),
                          'Nazwa Produktu', null, false, null),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Column(
                    children: <Widget>[
                      CustomInputField(210, Icon(Icons.add_location),
                          'Lokalizacja', null, false, null),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CustomInputFieldShort(
                              150,
                              150,
                              Icon(Icons.people_outline),
                              'Telefon',
                              null,
                              false,
                              null),
                          SizedBox(
                            width: 10.0,
                          ),
                          CustomInputFieldShort(
                              90,
                              90,
                              Icon(Icons.people_outline),
                              'Cena',
                              null,
                              false,
                              null),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: SizedBox(
                          height: 45,
                          child: Image.asset('assets/images/addpicturepng.png',
                              fit: BoxFit.fill),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  height: 65,
                                ),
                                ButtonTheme(
                                  buttonColor: Colors.lightBlue,
                                  minWidth: 50,
                                  height: 50,
                                  child: RaisedButton(
                                      color: pressAttention1
                                          ? Colors.red
                                          : Colors.green,
                                      onPressed: () {
                                        setState(() =>
                                            pressAttention1 = !pressAttention1);
                                      },
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0))),
                                ),
                                SizedBox(
                                  width: 13.0,
                                ),
                                ButtonTheme(
                                  buttonColor: Colors.lightBlue,
                                  minWidth: 50,
                                  height: 50,
                                  child: RaisedButton(
                                      child: Text(
                                        "2",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      color: pressAttention2
                                          ? Colors.red
                                          : Colors.green,
                                      onPressed: () {
                                        setState(() =>
                                            pressAttention2 = !pressAttention2);
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0))),
                                ),
                                SizedBox(
                                  width: 13.0,
                                ),
                                ButtonTheme(
                                  buttonColor: Colors.lightBlue,
                                  minWidth: 50,
                                  height: 50,
                                  child: RaisedButton(
                                      child: Text(
                                        "3",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      color: pressAttention3
                                          ? Colors.red
                                          : Colors.green,
                                      onPressed: () => setState(() =>
                                          pressAttention3 = !pressAttention3),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0))),
                                ),
                                SizedBox(
                                  width: 13.0,
                                ),
                                ButtonTheme(
                                  buttonColor: Colors.lightBlue,
                                  minWidth: 50,
                                  height: 50,
                                  child: RaisedButton(
                                      child: Text(
                                        "4",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      color: pressAttention4
                                          ? Colors.red
                                          : Colors.green,
                                      onPressed: () => setState(() =>
                                          pressAttention4 = !pressAttention4),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: SizedBox(
              height: 250,
              child: TextField(
                maxLength: 300,
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                decoration: new InputDecoration(
                    filled: true,
                    hintText: 'Tutaj wprowadź Opis',
                    fillColor: Colors.white,
                    enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                      color: Colors.lightBlue,
                      width: 2,
                    ))),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: SizedBox(
              height: 65,
              child: Image.asset('assets/images/rodzajproduktuv2.png',
                  fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Radio(
                      onChanged: (int e) => _changeState(e),
                      activeColor: Colors.amber,
                      value: 1,
                      groupValue: groupValue,
                    ),
                    Text('Zestaw',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      onChanged: (int e) => _changeState(e),
                      activeColor: Colors.amber,
                      value: 2,
                      groupValue: groupValue,
                    ),
                    Text('Box',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      onChanged: (int e) => _changeState(e),
                      activeColor: Colors.amber,
                      value: 3,
                      groupValue: groupValue,
                    ),
                    Text('Atomizer',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      onChanged: (int e) => _changeState(e),
                      activeColor: Colors.amber,
                      value: 4,
                      groupValue: groupValue,
                    ),
                    Text('Liquid',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.0, right: 40.0),
            child: ButtonTheme(
              buttonColor: Colors.lightBlue,
              minWidth: 50,
              height: 50,
              child: RaisedButton(
                  child: Text(
                    "Zatwierdz Produkt",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0))),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(149, 185, 199, 10),
    );
  }
}
