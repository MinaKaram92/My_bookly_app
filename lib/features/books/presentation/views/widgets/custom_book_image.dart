import 'package:bookly_app/core/utils/asstes_data.dart';
import 'package:bookly_app/features/books/data/models/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key, required this.book}) : super(key: key);
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: book.volumeInfo!.imageLinks!.thumbnail ?? '',
      fit: BoxFit.fill,
    );
  }
}
