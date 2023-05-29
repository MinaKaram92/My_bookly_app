import 'package:bookly_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomSearchTabs extends StatelessWidget {
  CustomSearchTabs({Key? key, required this.selected, required this.call})
      : super(key: key);
  final int selected;
  final Function call;
  final tabs = ['Relevance', 'Newest'];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey,
      ),
      width: width,
      height: 56,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 5),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => call(index),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            width: (width - 32) / 2 - 10,
            decoration: BoxDecoration(
              color: selected == index ? kPrimaryColor : Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              tabs[index],
              style: TextStyle(color: Colors.amber),
            ),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 10.0,
        ),
        itemCount: tabs.length,
      ),
    );
  }
}
