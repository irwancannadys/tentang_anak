import 'package:flutter/material.dart';

class DetailFruits extends StatefulWidget {
  const DetailFruits({Key? key}) : super(key: key);

  @override
  _DetailFruitsState createState() => _DetailFruitsState();
}

class _DetailFruitsState extends State<DetailFruits> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detail Fruits"),
        ),
        body: Container(),
      ),
    );
  }
}
