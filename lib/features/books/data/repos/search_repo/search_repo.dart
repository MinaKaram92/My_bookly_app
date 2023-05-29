import 'package:bookly_app/core/error_handling/failures.dart';
import 'package:bookly_app/features/books/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> getBooks(
      {required String category, String? orderBy});
}
