import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:vapestore/Classes/SpecificObjectDisplay.dart';
import 'package:vapestore/customwidgets/custominputfield.dart';
import 'package:vapestore/customwidgets/custominputfieldshort.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:vapestore/customwidgets/displayItemCard.dart';
import 'package:vapestore/screens/list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:vapestore/customwidgets/addpicture.dart';

class Test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _Test();
}

class _Test extends State<Test> {
  Stream _myStream;
//
 
  String tytul = 'Loading';
  String opis = 'Loading';
  String cena = 'Loading';
  String kontakt = 'Loading';
  var item;
  String elotext = 'elo';
  final databaseReferenceBox =
      FirebaseDatabase.instance.reference().child('products').child('Box');
  final Query queryBox =
      FirebaseDatabase.instance.reference().child('products').child('Box');

  readDataBox() async {
    databaseReferenceBox.once().then((DataSnapshot dataSnapShot) {
      databaseReferenceBox.onChildAdded.listen((e) {
        DataSnapshot data = e.snapshot;
        var val = data.value;
        item = new ObiektOferty(
            data.key,
            val[nameJ].toString(),
            val[localisationJ].toString(),
            val[descriptionJ].toString(),
            val[numberJ].toString(),
            val[priceJ].toString(),
            val[producttypeJ].toString());
        _showItem(item);
        _updateOffertItem(item);
      });
    });
  }

  _updateOffertItem(ObiektOferty item) async {
    print('_updateOffertItem');
    print("Nazwa = ${item.name} ");
    setState(() {
      tytul = item.name;
      opis = item.description;
      cena = item.price;
      kontakt = item.number;
    });
  }

  _showItem(ObiektOferty item) async {
    print('_ShowItem');
    print("Przedmiot 1");
    print("Nazwa = ${item.name} ");
    print("Lokalizacja = ${item.localisation}");
    print("Opis = ${item.description}");
    print("Numer = ${item.number} ");
    print("Cena = ${item.price} ");
  }

 /* Future<List<ObiektOferty>> _getObjects() async {
    List<ObiektOferty>  obiekty = [];
    for(var u  in jsonData){
      ObiektOferty obiekt = ObiektOferty();
      obiekty.add(obiekt);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(149, 185, 199, 10),
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
          ListView.builder(
            itemCount: 20,
            itemBuilder: (context,index){
             // final item=items[index];
            },
          ),
         StreamBuilder(
            stream: queryBox.onValue,
            builder: (context, snapshot) {
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Select lot');
                case ConnectionState.waiting:
                  return Text('Awaiting bids...');
                case ConnectionState.active:
                  return Row(children: <Widget>[Text('Aktywbyku\$${snapshot.data}'),
                  // readDataBox(),
                  // itemCardd(tytul.toString(),opis.toString(),cena.toString(),kontakt.toString(), 'assets/images/ehpro.jpg',false),
                  ]);
                case ConnectionState.done:
                  return Text('Done byku\$${snapshot.data} (closed)');
              }
            },
          )

        ],
      ),
    );
  }
}
