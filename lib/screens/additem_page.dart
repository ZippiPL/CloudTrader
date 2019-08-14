import 'package:flutter/material.dart';
import 'package:vapestore/customwidgets/custominputfield.dart';
import 'package:vapestore/customwidgets/custominputfieldshort.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:vapestore/screens/list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'additem_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:vapestore/customwidgets/addpicture.dart';

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
  String _productType = "Set";
  int groupValue = 0;
  String _productName;
  String _localisation;
  String _price;
  String _number;
  String _description;
  String zdj1_productanme;
  String zdj2_productanme;
  String zdj3_productanme;
  String zdj4_productanme;

  //
  var zdj1 = AddPicture();
  var zdj2 = AddPicture();
  var zdj3 = AddPicture();
  var zdj4 = AddPicture();
  File _image;
//connection
 createNameForImage(String _productName){
zdj1_productanme=_productName+'1';
zdj2_productanme=_productName+'2';
zdj3_productanme=_productName+'3';
zdj4_productanme=_productName+'4';

 }

//
  final databaseReferenceSet =
      FirebaseDatabase.instance.reference().child("products").child("Sets");
  final databaseReferenceBox =
      FirebaseDatabase.instance.reference().child("products").child("Box");
  final databaseReferenceAtom =
      FirebaseDatabase.instance.reference().child("products").child("Atomizer");
  final databaseReferenceLiquid =
      FirebaseDatabase.instance.reference().child("products").child("Liquid");
  final GlobalKey<FormState> _formKeyItem = GlobalKey<FormState>();
  final myControllerProductName = TextEditingController();
  final myControllerLocalisation = TextEditingController();
  final myControllerPrice = TextEditingController();
  final myControllerNumber = TextEditingController();
  final myControllerProductType = TextEditingController();
  final myControllerDescription = TextEditingController();

  TextEditingController _productNameFieldController;
  TextEditingController _localisationFieldController;
  TextEditingController _priceFieldController;
  TextEditingController _numberFieldController;
  TextEditingController _producttypeFieldController;
  TextEditingController _descriptioneFieldController;
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
        _productType = 'Atomizer';
      } else if (e == 4) {
        _productType = 'Liquid';
        groupValue = 4;
      }
    });
  }

  void _showToast(String toastText) {
    Toast.show("${toastText}", context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  }

  //Future getImage() async {
  //   var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
  //  setState((){
  //    _image=tempImage;
  //     print('Image Path $_image');
  //  });}

  _addItemToFirebase() {
//wycaiganie tekstu

    _showToast("Dodawanie Przedmiotu");
    //
    _productNameFieldController =
        new TextEditingController(text: myControllerProductName.text);
    _localisationFieldController =
        new TextEditingController(text: myControllerLocalisation.text);
    _priceFieldController =
        new TextEditingController(text: myControllerPrice.text);
    _numberFieldController =
        new TextEditingController(text: myControllerNumber.text);
    _producttypeFieldController =
        new TextEditingController(text: myControllerProductType.text);
    _descriptioneFieldController =
        new TextEditingController(text: myControllerDescription.text);
    //
    _productName = _productNameFieldController.text;
    _localisation = _localisationFieldController.text;
    _price = _priceFieldController.text;
    _number = _numberFieldController.text;

    // _productType = _producttypeFieldController.text;
    _description = _descriptioneFieldController.text;
    final formState = _formKeyItem.currentState;

    if (formState.validate()) {
      formState.save();
      try {
        //final StorageReference firebaseStorageRef= FirebaseStorage.instance.ref().child('image1.jpg');
        //  final StorageUploadTask task = firebaseStorageRef.putFile(_image);
        if (_productType == 'Set') {
          databaseReferenceSet.push().set({
            'Nazwa Produktu': '${_productName}',
            'Lokalizacja': '${_localisation}',
            'Cena': '${_price}',
            'Numer': '${_number}',
            'Typ produktu': '${_productType}',
            'Opis': '${_description}'
          });
          print('Poszlo Do Setow');
        } else if (_productType == 'Box') {
          databaseReferenceBox.push().set({
            'Nazwa Produktu': '${_productName}',
            'Lokalizacja': '${_localisation}',
            'Cena': '${_price}',
            'Numer': '${_number}',
            'Typ produktu': '${_productType}',
            'Opis': '${_description}'
          });

          print('Poszlo Do Boxow');
        } else if (_productType == 'Atomizer') {
          databaseReferenceAtom.push().set({
            'Nazwa Produktu': '${_productName}',
            'Lokalizacja': '${_localisation}',
            'Cena': '${_price}',
            'Numer': '${_number}',
            'Typ produktu': '${_productType}',
            'Opis': '${_description}'
          });

          print('Poszlo do Atomizer');
        } else if (_productType == 'Liquid') {
          databaseReferenceLiquid.push().set({
            'Nazwa Produktu': '${_productName}',
            'Lokalizacja': '${_localisation}',
            'Cena': '${_price}',
            'Numer': '${_number}',
            'Typ produktu': '${_productType}',
            'Opis': '${_description}'
          });
          print('Poszlo Do Liquid');
        }
      } catch (e) {
        print('Error $e');
      }
    }
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKeyItem,
        child: ListView(
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
                        CustomInputField(
                            210,
                            Icon(Icons.text_format),
                            'Nazwa Produktu',
                            _productName,
                            false,
                            myControllerProductName),
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
                        CustomInputField(
                            210,
                            Icon(Icons.add_location),
                            'Lokalizacja',
                            _localisation,
                            false,
                            myControllerLocalisation),
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
                                _number,
                                false,
                                myControllerNumber),
                            SizedBox(
                              width: 10.0,
                            ),
                            CustomInputFieldShort(
                                90,
                                90,
                                Icon(Icons.people_outline),
                                'Cena',
                                _price,
                                false,
                                myControllerPrice),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: SizedBox(
                            height: 45,
                            child: Image.asset(
                                'assets/images/addpicturepng.png',
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
                                          zdj1.getImage();
                                          setState(() => pressAttention1 =
                                              !pressAttention1);
                                        },
                                        child: Text(
                                          "1",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    10.0))),
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
                                          zdj2.getImage();
                                          setState(() => pressAttention2 =
                                              !pressAttention2);
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    10.0))),
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
                                        onPressed: () {
                                          zdj3.getImage();
                                          setState(() => pressAttention3 =
                                              !pressAttention3);
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    10.0))),
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
                                        onPressed: () {
                                          zdj4.getImage();
                                          setState(() => pressAttention4 =
                                              !pressAttention4);
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    10.0))),
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
                  controller: myControllerDescription,
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
                      Text(
                        'Zestaw',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
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
                      Text(
                        'Box',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
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
                      Text(
                        'Atomizer',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
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
                      Text(
                        'Liquid',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onPressed: () {
                      _addItemToFirebase();
                      createNameForImage(_productName);
                      zdj1.uploadPic(_productName,zdj1_productanme);
                      zdj2.uploadPic(_productName,zdj2_productanme);
                      zdj3.uploadPic(_productName,zdj3_productanme);
                      zdj4.uploadPic(_productName,zdj4_productanme);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0))),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(149, 185, 199, 10),
    );
  }

  Widget enableUpload() {}
}
