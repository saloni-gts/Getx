import 'package:flutter/material.dart';

class AllItems extends StatefulWidget {
  const AllItems({Key? key}) : super(key: key);

  @override
  State<AllItems> createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF035AA6),

body: Center(
  child: Text("all products screen",
  style: TextStyle(
    color: Colors.white
  )),
),

    );
  }
}
