import 'package:bookly_app/core/utils/functions.dart';
import 'package:bookly_app/features/books/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/books/data/repos/search_repo/search_repo.dart';
import 'package:bookly_app/features/books/presentation/view_model/cubits/search_cubit/search_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this._searchRepo) : super(InitialSearchState());
  final SearchRepo _searchRepo;

  final TextEditingController controller = TextEditingController();

  final List<bool> selected = [true, false];

  void changeToggleIndex(int index) {
    for (var i = 0; i < selected.length; i++) {
      if (i == index) {
        selected[i] = true;
      } else {
        selected[i] = false;
      }
    }
    emit(ChangeToggleState());
  }

  void getDataPerIndex(int index) {
    if (index == 0) {
      getBooks(category: controller.text);
    } else {
      getBooks(category: controller.text, orderBy: 'newest');
    }
  }

  List<BookModel> booksList = [];

  Future<void> getBooks({required String category, String? orderBy}) async {
    emit(LoadingSearchState());
    var res = await _searchRepo.getBooks(category: category, orderBy: orderBy);
    res.fold((failure) {
      emit(FailureSearchState(failure.errMessage));
    }, (books) {
      booksList = books;
      emit(SuccessSearchState());
    });
  }
}
