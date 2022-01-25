import 'package:bootstrap/responsive_widgets/next_col.dart';
import 'package:bootstrap/responsive_widgets/next_row.dart';
import 'package:flutter/material.dart';

class NextHome extends StatelessWidget {
  const NextHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        NextRow(childrens: [
          NextCol(
            sizes: "col-12 col-md-6 col-lg-4",
            child: Container(
              color: Colors.red,
              height: 150,
            ),
          ),
          NextCol(
            sizes: "col-12 col-md-6 col-lg-4",
            child: Container(
              color: Colors.grey,
              height: 150,
            ),
          ),
          NextCol(
            sizes: "col-12 col-md-6 col-lg-4",
            child: Container(
              color: Colors.blueAccent,
              height: 150,
            ),
          ),
          NextCol(
            sizes: "col-12 col-md-6 col-lg-4",
            child: Container(
              color: Colors.lightBlueAccent,
              height: 150,
            ),
          )
        ])
      ]),
    );
  }
}
