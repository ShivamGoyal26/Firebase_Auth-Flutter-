import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  static const routeName = '/product-details';

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final detail = ModalRoute.of(context).settings.arguments as List;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Details',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18.0,
                color: Colors.white,
              )),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
              color: Colors.white,
            )
          ],
        ),
        backgroundColor: Color(0xFF7A9BEE),
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 82.0,
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  top: 70.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                      color: Colors.white,
                    ),
                    height: MediaQuery.of(context).size.height - 100,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Positioned(
                  top: 30.0,
                  left: (MediaQuery.of(context).size.width / 2) - 100,
                  child: Hero(
                    tag: detail[0],
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              detail[0],
                            ),
                            fit: BoxFit.cover),
                      ),
                      height: 200.0,
                      width: 200.0,
                    ),
                  ),
                ),
                Positioned(
                  top: 250.0,
                  left: 25,
                  right: 25,
                  child: Column(
                    children: <Widget>[
                      Text(
                        detail[1],
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            detail[2],
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20.0,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            height: 25,
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
