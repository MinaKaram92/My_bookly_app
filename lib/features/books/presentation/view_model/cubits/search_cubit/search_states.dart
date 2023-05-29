import 'package:bookly_app/features/books/data/models/book_model/book_model.dart';

abstract class SearchStates {}

class InitialSearchState extends SearchStates {}

class ChangeToggleState extends SearchStates {}

class LoadingSearchState extends SearchStates {}

class SuccessSearchState extends SearchStates {}

class FailureSearchState extends SearchStates {
  final String errMessage;

  FailureSearchState(this.errMessage);
}
