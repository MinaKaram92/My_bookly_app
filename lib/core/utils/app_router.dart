import 'package:bookly_app/features/books/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/books/presentation/views/books_view.dart';

import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/books/presentation/views/book_details_view.dart';
import '../../features/books/presentation/views/search_home_view.dart';

abstract class AppRouter {
  static const searchHomeView = '/searchHomeView';
  static const booksView = '/booksView';
  static const bookDetailsView = '/bookDetailsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: booksView,
        builder: (context, state) => const BooksView(),
      ),
      GoRoute(
        path: bookDetailsView,
        builder: (context, state) =>
            BookDetailsView(book: state.extra as BookModel),
      ),
      GoRoute(
        path: searchHomeView,
        builder: (context, state) => const SearchHomeView(),
      ),
    ],
  );
}
