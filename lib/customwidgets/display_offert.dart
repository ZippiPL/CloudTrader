import 'dart:async';
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

import 'displayItemCard.dart';

class DisplayOffert extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _DisplayOffert();
}

class _DisplayOffert extends State<DisplayOffert> {
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
  final databaseReferenceAtom =
      FirebaseDatabase.instance.reference().child('products').child('Atomizer');
  final Query queryAtom =
      FirebaseDatabase.instance.reference().child('products').child('Atomizer');
//

//

  var _opis;
 readDataBox() async {
      databaseReferenceBox.once().then((DataSnapshot dataSnapShot) {
     await databaseReferenceBox.onChildAdded.listen((e) {
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
      }
      );
    });
    _showItem(item);
    _updateOffertItem(item);
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
      elotext = 'Atom';
      setState(() {
        build(context);
      });
      // print(values['Opis']);
    });
  }

  printWait(int ile) {
    new Timer(Duration(seconds: ile), () => connect(ile));
  }

  connect(int ile) {
    print('Czekalem${ile}');
    readDataBox();
  }

  @override
  Widget build(BuildContext context) {
    readDataBox();
    printWait(1);
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
          RaisedButton(
            child: Text('Atom'),
            color: Colors.blue,
            onPressed: readDataAtom,
          ),
          Text('Tekst = ${elotext.toString()}'),
          itemCardd(tytul.toString(), opis.toString(), cena.toString(),
              kontakt.toString(), 'assets/images/ehpro.jpg', false),
        ],
      ),
    );
  }
}
