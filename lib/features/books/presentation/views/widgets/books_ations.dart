import 'package:bookly_app/core/utils/functions.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/books/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/books/presentation/views/widgets/custom_drop_down_button.dart';
import 'package:flutter/material.dart';

class BooksActions extends StatelessWidget {
  final BookModel book;

  const BooksActions({Key? key, required this.book}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomDropDownButton(book: book),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () {
              launchGivenUrl(context, book.volumeInfo!.previewLink!);
            },
            bakgroundColor: Colors.red,
            text: 'Free Preview',
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
