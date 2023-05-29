import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/cubits/search_cubit/search_cubit.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SearchCubit>(context);
    return TextField(
      controller: cubit.controller,
      decoration: InputDecoration(
        hintText: 'What do you wanna read about ?',
        suffixIcon: IconButton(
          onPressed: () {
            BlocProvider.of<SearchCubit>(context)
                .getBooks(category: cubit.controller.text);
          },
          icon: const Icon(
            Icons.search,
            size: 26.0,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
      keyboardType: TextInputType.text,
    );
  }
}
