import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookTypeItem extends StatelessWidget {
  const BookTypeItem({Key? key, required this.color, required this.text})
      : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 25.0,
      color: color,
      child: Center(
        child: Text(
          text,
        ),
      ),
    );
  }
}
