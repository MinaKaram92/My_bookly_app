import 'package:bookly_app/features/books/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/books/presentation/views/widgets/book_type_item.dart';
import 'package:flutter/material.dart';

class BookType extends StatelessWidget {
  const BookType({Key? key, required this.book}) : super(key: key);

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BookTypeItem(
            color:
                book.accessInfo!.pdf!.isAvailable! ? Colors.green : Colors.red,
            text: 'Pdf'),
        SizedBox(
          width: 10.0,
        ),
        BookTypeItem(
            color:
                book.accessInfo!.epub!.isAvailable! ? Colors.green : Colors.red,
            text: 'Epub'),
      ],
    );
  }
}
