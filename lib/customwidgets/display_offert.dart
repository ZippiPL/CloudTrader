import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:vapestore/Classes/SpecificObjectDisplay.dart';
import 'package:vapestore/customwidgets/custominputfield.dart';
import 'package:vapestore/customwidgets/custominputfieldshort.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:vapestore/screens/list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:vapestore/customwidgets/addpicture.dart';

class DisplayOffert extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _DisplayOffert();
}

class _DisplayOffert extends State<DisplayOffert> {
//
String tytul='Loading';
String opis='Loading';
String cena='Loading';
String kontakt='Loading';
var item  ;
 String elotext='elo';
  final databaseReferenceBox =
      FirebaseDatabase.instance.reference().child('products').child('Box').limitToFirst(1);
  final Query queryBox =
      FirebaseDatabase.instance.reference().child('products').child('Box');
  final databaseReferenceAtom =
      FirebaseDatabase.instance.reference().child('products').child('Atomizer');
  final Query queryAtom =
      FirebaseDatabase.instance.reference().child('products').child('Atomizer');
//

//
   
  var _opis;
  readDataBox() async {
    databaseReferenceBox.once().then((DataSnapshot dataSnapShot) {
    
        databaseReferenceBox.onChildAdded.listen((e){
          DataSnapshot data = e.snapshot;
          var val = data.value;
          item = new ObiektOferty(data.key,val[nameJ].toString(),val[localisationJ].toString(),val[descriptionJ].toString(),val[numberJ].toString(),val[priceJ].toString(),val[producttypeJ].toString());
          _showItem(item);
           _updateOffertItem(item);
        }
        
        );
    });
  }
  _updateOffertItem(ObiektOferty item)async{
    print('_updateOffertItem');
    print("Nazwa = ${item.name} ");
    setState(() {
      tytul = item.name;
      opis=item.description;
      cena=item.price;
      kontakt=item.number;

    });
  }
 _showItem(ObiektOferty item)async {
     print('_ShowItem');
     print("Przedmiot 1");
    print("Nazwa = ${item.name} ");
     print("Lokalizacja = ${item.localisation}");
      print("Opis = ${item.description}");
       print("Numer = ${item.number} ");
        print("Cena = ${item.price} ");
         print("Typ = ${item.producttype} ");
  }
  // Future<List<ObiektOferty>>fetchObiektOferty(HttpClient client) async{
    // final response = await client.get(host, port, path)
  // }
   
  readDataAtom() {
    databaseReferenceAtom.once().then((DataSnapshot dataSnapShot) {
      print(databaseReferenceAtom.equalTo('Opis'));
      // Map<dynamic,dynamic>values=dataSnapShot.value['Opis'];
      print(dataSnapShot.value);
      print('     ');
      elotext='Atom';
      setState(() {
       build(context); 
      });
      // print(values['Opis']);
    });
  }

  @override
  Widget build(BuildContext context) {

  readDataBox();
  
  
    return Scaffold(
      appBar: AppBar(
        title: Text('Elo'),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text('Box'),
            color: Colors.red,
            onPressed: readDataBox,
          ),
          RaisedButton(
            child: Text('Atom'),
            color: Colors.blue,
            onPressed: readDataAtom,
          ),
          Text('Tekst = ${elotext.toString()}'),
          itemCard('${tytul.toString()}', 'assets/images/ehpro.jpg', false),
        ],
      ),
    );
  }

  Widget itemCard(String title, String imgPath, bool isFavourite) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: Container(
        height: 150.0,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              width: 140.0,
              height: 150.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgPath), fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Material(
                      elevation: isFavourite ? 0.0 : 2.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: isFavourite
                                ? Colors.white.withOpacity(0.2)
                                : Colors.white),
                        child: Center(
                            child: isFavourite
                                ? Icon(
                                    Icons.report,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.report,
                                    color: Colors.red,
                                  )),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                    width: 175.0,
                    child: Text(
                      '${opis.toString()}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.grey,
                          fontSize: 12.0),
                    )),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: 35.0),
                    Container(
                      height: 30,
                      width: 50.0,
                      color: Colors.lightBlue,
                      child: Center(
                        child: Text(
                          '${cena.toString()}',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 100,
                      color: Colors.lightBlueAccent,
                      child: Center(
                        child: Text('${kontakt.toString()}'),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
