import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/books/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/books/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BooksListViewItem extends StatelessWidget {
  const BooksListViewItem({Key? key, required this.book}) : super(key: key);

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetailsView, extra: book);
      },
      child: Row(
        children: [
          SizedBox(
            height: 130,
            width: 90.0,
            child: CustomBookImage(
              book: book,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .6,
                  child: Text(
                    book.volumeInfo!.title!,
                    style: const TextStyle(fontSize: 20.0),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  book.volumeInfo!.authors == null
                      ? 'Authour Unknown'
                      : book.volumeInfo!.authors![0],
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Text(
                      'Published Date: ${book.volumeInfo!.publishedDate?.substring(0, 4)}',
                    ),
                    const Spacer(),
                    Text(
                        'Pages: ${book.volumeInfo!.pageCount?.toString() ?? '0'}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
