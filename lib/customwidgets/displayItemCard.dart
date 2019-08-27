import 'package:flutter/material.dart';

Widget itemCardd(String title, String description, String price, String number,
    String imgPath, bool isFavourite) {
  return Padding(
    padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
    child: Container(
      height: 200.0,
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
                    '${description.toString()}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        color: Colors.grey,
                        fontSize: 12.0),
                  )),
              SizedBox(
                height: 90.0,
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 75.0),
                  Container(
                    height: 30,
                    width: 50.0,
                    color: Colors.lightBlue,
                    child: Center(
                      child: Text(
                        '${price.toString()}',
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
                      child: Text('${number.toString()}',style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                  )],
              )
            ],
          )
        ],
      ),
    ),
  );
}
