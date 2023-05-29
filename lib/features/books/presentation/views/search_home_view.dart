import 'package:bookly_app/core/utils/asstes_data.dart';
import 'package:bookly_app/features/books/presentation/views/widgets/search_home_view_body.dart';
import 'package:flutter/material.dart';

class SearchHomeView extends StatelessWidget {
  const SearchHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetsData.logo,
          height: 40.0,
        ),
      ),
      body: const SearchHomeViewBody(),
    );
  }
}
