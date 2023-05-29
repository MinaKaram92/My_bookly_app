import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/books/presentation/views/widgets/books_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../view_model/cubits/search_cubit/search_cubit.dart';

class BooksView extends StatelessWidget {
  const BooksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBooksViewAppBar(context),
      body: const BooksViewBody(),
    );
  }

  AppBar customBooksViewAppBar(BuildContext context) {
    String category = BlocProvider.of<SearchCubit>(context).controller.text;
    return AppBar(
      backgroundColor: Colors.blue[900],
      title: Text(
        'Exploring ${category[0].toUpperCase()}${category.substring(1)}',
      ),
      titleSpacing: 10,
      actions: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).go(AppRouter.searchHomeView);
          },
          icon: Icon(
            Icons.search,
            size: 28.0,
          ),
        ),
      ],
    );
  }
}
