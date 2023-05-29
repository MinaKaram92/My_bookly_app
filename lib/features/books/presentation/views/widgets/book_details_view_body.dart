import 'package:bookly_app/features/books/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/books/presentation/views/widgets/books_ations.dart';
import 'package:bookly_app/features/books/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/books/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.book}) : super(key: key);

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomBookDetailsAppBar(),
            Center(
              child: SizedBox(
                width: size.width * 1.2 / 3,
                child: CustomBookImage(book: book),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              book.volumeInfo!.title!,
              style: const TextStyle(fontSize: 30.0),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              book.volumeInfo!.authors == null
                  ? 'Authour Unknown'
                  : book.volumeInfo!.authors![0],
              style: const TextStyle(fontSize: 18.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Text(
                book.volumeInfo!.subTitle ?? 'Subtitle Unavailable',
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
            Text(
              book.volumeInfo!.description ?? 'Description Unavailable',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(
              height: 18.0,
            ),
            BooksActions(book: book),
            const SizedBox(
              height: 18.0,
            ),
          ],
        ),
      ),
    );
  }
}
