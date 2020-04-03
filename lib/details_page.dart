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
        title: Text(detail[1]),
      ),
      body: Center(
        child: Text(detail[0]),
      ),
    );
  }
}
