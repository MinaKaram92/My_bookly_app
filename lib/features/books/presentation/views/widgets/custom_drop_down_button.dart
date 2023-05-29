import 'package:bookly_app/core/utils/functions.dart';
import 'package:bookly_app/features/books/data/models/book_model/book_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({Key? key, required this.book}) : super(key: key);

  final BookModel book;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  late List<DropdownMenuItem<String>> items;
  @override
  void initState() {
    super.initState();

    items = [
      DropdownMenuItem(
        value: 'PDF',
        onTap: () {
          launchGivenUrl(context, widget.book.accessInfo!.pdf!.downloadLink);
        },
        child: const Text(
          'PDF',
        ),
      ),
      DropdownMenuItem(
        value: 'EPUB',
        onTap: () {
          launchGivenUrl(context, widget.book.accessInfo!.epub!.downloadLink);
        },
        child: const Text('EPUB'),
      )
    ];
  }

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        menuItemStyleData: MenuItemStyleData(),
        hint: const Text(
          'Download',
          style: TextStyle(color: Colors.black),
        ),
        items: items,
        style: const TextStyle(color: Colors.black),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.arrow_drop_down),
          iconEnabledColor: Colors.black,
        ),
        alignment: AlignmentDirectional.center,
        buttonStyleData: const ButtonStyleData(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
        ),
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
        },
        value: selectedValue,
      ),
    );
  }
}
