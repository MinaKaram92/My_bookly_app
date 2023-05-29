import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/functions.dart';
import 'package:bookly_app/features/books/presentation/view_model/cubits/search_cubit/search_cubit.dart';
import 'package:bookly_app/features/books/presentation/view_model/cubits/search_cubit/search_states.dart';
import 'package:bookly_app/features/books/presentation/views/widgets/search_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchHomeViewBody extends StatelessWidget {
  const SearchHomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, SearchStates>(
      listener: (context, state) {
        if (state is SuccessSearchState) {
          GoRouter.of(context).go(AppRouter.booksView);
        } else if (state is FailureSearchState) {
          showSnack(context, state.errMessage);
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/book.jpg'),
            const SizedBox(
              height: 50.0,
            ),
            const SearchTextField(),
          ],
        ),
      ),
    );
  }
}
