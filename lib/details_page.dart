import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  static const routeName = '/product-details';

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var selectedCard = 'WEIGHT';
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
                        height: 40,
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
                          Container(
                            width: 125.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17.0),
                                color: Color(0xFF7A9BEE)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Color(0xFF7A9BEE),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  '2',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontSize: 15,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Color(0xFF7A9BEE),
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _buildInfoCard('WEIGHT', '300', 'G'),
                            SizedBox(
                              width: 10.0,
                            ),
                            _buildInfoCard('CALORIES', '267', 'CAL'),
                            SizedBox(
                              width: 10.0,
                            ),
                            _buildInfoCard('VITAMINS', 'A, B6', 'VIT'),
                            SizedBox(
                              width: 10.0,
                            ),
                            _buildInfoCard('AVAIL', 'NO', 'AV'),
                            SizedBox(
                              width: 10.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Text(
                              "\$52.00",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }

  Widget _buildInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
        onTap: () {
          selectCard(cardTitle);
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color:
                  cardTitle == selectedCard ? Color(0xFF7A9BEE) : Colors.white,
              border: Border.all(
                  color: cardTitle == selectedCard
                      ? Colors.transparent
                      : Colors.grey.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 0.75),
            ),
            height: 150.0,
            width: 100.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Text(cardTitle,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          color: cardTitle == selectedCard
                              ? Colors.white
                              : Colors.grey.withOpacity(0.7),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(info,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                color: cardTitle == selectedCard
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text(unit,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: cardTitle == selectedCard
                                  ? Colors.white
                                  : Colors.black,
                            ))
                      ],
                    ),
                  )
                ])));
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
