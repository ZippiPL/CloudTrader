import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vapestore/customwidgets/custominputfield.dart';
import 'package:vapestore/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';

class list extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _list();
}

class _list extends State<list> {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('elo'),
      ),
      body: new StreamBuilder(
        stream: Firestore.instance.collection("users").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return new Text('Connecting....');
          else {
            return new ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.documents[index];
                return new Text(
                  ds['nick'],
                );
              },
            );
          }
        },
      ),
    );
  }
}
