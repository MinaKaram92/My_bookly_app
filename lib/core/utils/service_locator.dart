import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/books/data/repos/search_repo/search_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupGetIt() {
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<SearchRepoImpl>(
      SearchRepoImpl(getIt.get<ApiService>()));
}
