import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  static const routeName = '/product-details';
  final heroTag;
  final foodName;
  final foodPrice;

  DetailsPage({
    this.foodName,
    this.foodPrice,
    this.heroTag,
  });
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
                  top: 75.0,
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
              ],
            )
          ],
        ));
  }
}
