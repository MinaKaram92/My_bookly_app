import 'package:bookly_app/features/books/presentation/view_model/cubits/search_cubit/search_cubit.dart';
import 'package:bookly_app/features/books/presentation/view_model/cubits/search_cubit/search_states.dart';
import 'package:bookly_app/features/books/presentation/views/widgets/books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksViewBody extends StatelessWidget {
  const BooksViewBody({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        var cubit = BlocProvider.of<SearchCubit>(context);
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: ToggleButtons(
                    isSelected: cubit.selected,
                    onPressed: (index) {
                      cubit.changeToggleIndex(index);
                      cubit.getDataPerIndex(index);
                    },
                    constraints:
                        const BoxConstraints(minWidth: 120.0, minHeight: 50.0),
                    selectedColor: Colors.blue,
                    children: const [
                      Text(
                        'Relevance',
                      ),
                      Text('Newest'),
                    ],
                  ),
                ),
              ),
              BooksListView(books: cubit.booksList),
            ],
          ),
        );
      },
    );
  }
}
