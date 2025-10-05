import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/Features/Home/domain/repo/home_repo.dart';
import 'package:stylish/Features/Home/domain/repo/home_repo_imple.dart';
import 'package:stylish/Features/auth/data/repo/auth_repo.dart';
import 'package:stylish/Features/auth/data/repo/auth_repo_implementation.dart';
import 'package:stylish/Features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:stylish/core/service/api_service.dart';
import 'package:stylish/core/utils/network/firebase_notification.dart';
import 'package:stylish/core/utils/shared_pref.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator({
  String baseUrl = 'https://dummyjson.com/',
}) async {
  /// dio setup

  sl.registerLazySingleton<Dio>(() {
    final dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(LogInterceptor(responseBody: true));
    return dio;
  });
  sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImplementations(sl<ApiService>()),
  );
  // Repos
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImplementation());

  // Cubits
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl<AuthRepo>()));
  //shared pref
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<SharedPref>(() => SharedPref(sharedPref: sl<SharedPreferences>()));
//
sl.registerLazySingleton<FirebaseNotification>(() => FirebaseNotification());

}
