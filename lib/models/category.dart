import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const Category({
    Key? key,
    required this.id,
    required this.title,
    this.color = Colors.orange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// class Category {
//   final String id;
//   final String title;
//   final Color color;

//   const Category({
//     required this.id,
//     required this.title,
//     this.color = Colors.orange,
//   });
// }
