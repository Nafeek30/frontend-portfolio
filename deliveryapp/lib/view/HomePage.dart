import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../utilities/WaveClipper.dart';
import './ScratchCardPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  BuildContext context;

  void stateChanged(Function fn) {
    setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xFFcf40ff),
        backgroundColor: Colors.white,
        items: <Widget>[
          Icon(Icons.home, size: 30,),
          Icon(Icons.person, size: 30,),
          Icon(Icons.tab, size: 30,),
          Icon(Icons.shopping_basket, size: 30,),
        ],
        onTap: (index) {
          if(index == 0) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
          }
          if(index == 2) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => ScratchCardPage(),
            ));
          }
        },
      ),
      body: Column(
        children: <Widget>[
          // Stack will contain the pink color and search bar
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFFcf40ff),
                      Color(0xFFdf00ff),
                      Color(0xFFbf00ff),
                      Color(0xFFdf00ff),
                      Colors.pinkAccent,
                    ]),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.height / 2,
                  ),
                  Text(
                    'eatOS',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 70,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'by POSLABS',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: TextField(
                        controller: TextEditingController(),
                        cursorColor: Color(0xFFcf40ff),
                        decoration: InputDecoration(
                          hintText: 'Search food and restaurants...',
                          hintStyle:
                              TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            child: FlatButton(
                              child:
                                  Icon(Icons.search, color: Colors.pink[600]),
                              onPressed: () {},
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Popular Items',
              style: TextStyle(
                color: Color(0xFFcf40ff),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  makeItem('assets/images/comboPlatter.jpg', 15.49, 'Combo Platter'),
                  makeItem('assets/images/seafoodPot.jpg', 20.49, 'Seafood Pot'),
                  makeItem('assets/images/sushiRoll.jpg', 12.99, 'Sushi Roll'),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),

        ],
      ),
    );
  }

  Widget makeItem(String image, double price, String name) {
    return AspectRatio(
      aspectRatio: 1 / 1.2,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.favorite, color: Colors.white,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '\$ $price', 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                      '$name', 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
