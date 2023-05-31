import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/books/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/error_handling/failures.dart';
import 'package:bookly_app/features/books/data/repos/search_repo/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService _apiService;
  SearchRepoImpl(this._apiService);

  @override
  Future<Either<Failure, List<BookModel>>> getBooks(
      {required String category, String? orderBy}) async {
    Map<String, dynamic> params = {
      'q': category,
      'filter': 'free-ebooks',
    };

    if (orderBy != null) {
      params.addAll({'orderBy': orderBy});
    }
    try {
      var response = await _apiService.getData(params);

      Map<String, dynamic> data = jsonDecode(response.body);

      List<BookModel> books = [];
      for (var book in data['items']) {
        books.add(BookModel.fromJson(book));
      }
      return right(books);
    } catch (e) {
      return left(ServerFailure.fromErrorType(e));
    }
  }
}
