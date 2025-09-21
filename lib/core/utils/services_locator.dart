import 'package:get_it/get_it.dart';
import 'package:stylish/Features/auth/data/repo/auth_repo.dart';
import 'package:stylish/Features/auth/data/repo/auth_repo_implementation.dart';
import 'package:stylish/Features/auth/presentation/manager/cubit/auth_cubit.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Repos
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImplementation());

  // Cubits
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl<AuthRepo>()));
}
