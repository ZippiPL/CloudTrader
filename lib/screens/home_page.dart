import 'package:flutter/material.dart';
import 'package:vapestore/screens/additem_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum FormType { sets, boxs,atomizers,liquids }

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FormType _formType = FormType.liquids;
  PageController pageController;
  List<String> images = [
    'assets/images/cloudtrader.png',
    'assets/images/ehpro.jpg',
    'assets/images/VapeMons.jpg',
  ];

   @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(149, 185, 199, 10),
      body: Form(
              key: _formKey,
              child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 180.0,
                      width: double.infinity,
                      color: Colors.lightBlue,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                                width: MediaQuery.of(context).size.width - 60.0),
                            Container(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: () {},
                                color: Colors.lightBlue,
                                iconSize: 30.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text(
                            ' Cloud Trade',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 35.0),
                          child: Text(
                            ' Czego dzisiaj szukasz ?',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(5.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search,
                                    color: Colors.blueGrey, size: 30.0),
                                contentPadding:
                                    EdgeInsets.only(left: 30, top: 15),
                                hintText: 'Szukaj',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Quicksand',
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 15.0),
                Stack(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Material(
                      elevation: 1.0,
                      child: Container(
                        height: 75.0,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 75.0,
                          width: MediaQuery.of(context).size.width / 4,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/set.png'),
                                  ),
                                ),
                              ),
                              Text(
                                'Zestawy',
                                style: TextStyle(fontFamily: 'Quicksand'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 75.0,
                          width: MediaQuery.of(context).size.width / 4,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/mod.png'),
                                  ),
                                ),
                              ),
                              Text(
                                'Boxy',
                                style: TextStyle(fontFamily: 'Quicksand'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 75.0,
                          width: MediaQuery.of(context).size.width / 4,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/atom2.jpg'),
                                  ),
                                ),
                              ),
                              Text(
                                'Atomizery',
                                style: TextStyle(fontFamily: 'Quicksand'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 75.0,
                          width: MediaQuery.of(context).size.width / 4,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/bottle.png'),
                                  ),
                                ),
                              ),
                              Text(
                                'Liquidy',
                                style: TextStyle(fontFamily: 'Quicksand'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                
               
                itemCard('EHPRO COLD STEEL', 'assets/images/ehpro.jpg', false),
                itemCard('VapeMons GearBox', 'assets/images/VapeMons.jpg', true),
                itemCard('Vandy Vape APOLLO ', 'assets/images/apollo.jpg', false),
                  itemCard('EHPRO COLD STEEL', 'assets/images/ehpro.jpg', false),
                itemCard('VapeMons GearBox', 'assets/images/VapeMons.jpg', true),
                itemCard('Vandy Vape APOLLO ', 'assets/images/apollo.jpg', false),
                  itemCard('EHPRO COLD STEEL', 'assets/images/ehpro.jpg', false),
                itemCard('VapeMons GearBox', 'assets/images/VapeMons.jpg', true),
                itemCard('Vandy Vape APOLLO ', 'assets/images/apollo.jpg', false),
                  itemCard('EHPRO COLD STEEL', 'assets/images/ehpro.jpg', false),
                itemCard('VapeMons GearBox', 'assets/images/VapeMons.jpg', true),
                itemCard('Vandy Vape APOLLO ', 'assets/images/apollo.jpg', false),
                        
              ],
            )
          ],
        ),
      ),
      floatingActionButton:FloatingActionButton(child: Text('+',style: TextStyle(fontSize: 30),),onPressed: (){

        Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddItemPage()));

      },backgroundColor: Colors.red,),
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
                                : Icon(Icons.report,color:Colors.red,)),
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
                      'Scandinavian small sized double sofa imported full leather / Dale Italia oil wax leather black',
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
                          '59.99',
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
                        child: Text('Kontakt'),
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