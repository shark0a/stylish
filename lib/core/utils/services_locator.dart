import 'package:get_it/get_it.dart';
import 'package:stylish/Features/auth/data/repo/auth_repo.dart';
import 'package:stylish/Features/auth/data/repo/auth_repo_implementation.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<AuthRepo>(AuthRepoImplementation());
}
