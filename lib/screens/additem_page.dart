import 'package:flutter/material.dart';
import 'package:vapestore/customwidgets/custominputfield.dart';
import 'package:vapestore/customwidgets/custominputfieldshort.dart';

class AddItemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddItemPage();
}

class _AddItemPage extends State<AddItemPage> {
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
                                      color: Colors.lightBlue,
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      onPressed: () {},
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
                                      onPressed: () {},
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
                                      onPressed: () {},
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
                                      onPressed: () {},
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
      backgroundColor: Colors.amber,
    );
  }
}
