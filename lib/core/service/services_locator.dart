import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/Features/Home/domain/repo/home_repo.dart';
import 'package:stylish/Features/Home/domain/repo/home_repo_imple.dart';
import 'package:stylish/Features/auth/data/models/user_response_model.dart';
import 'package:stylish/Features/auth/data/repo/auth_repo.dart';
import 'package:stylish/Features/auth/data/repo/auth_repo_implementation.dart';
import 'package:stylish/Features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:stylish/core/service/api_service.dart';
import 'package:stylish/core/utils/helper/hive_keys.dart';
import 'package:stylish/core/utils/helper/hive_register_adapter_classes.dart';
import 'package:stylish/core/utils/helper/hive_service.dart';
import 'package:stylish/core/utils/network/firebase_notification.dart';
import 'package:stylish/core/utils/shared_pref.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator({
  String baseUrl = 'https://dummyjson.com/',
}) async {
  final hiveService = HiveService();
  //hive service initialization
  await hiveService.init();
  //register Hive adapters
  HiveAdapters.registerAll();
  //regsister hive service
  sl.registerLazySingleton<HiveService>(() => hiveService);
  // open Hive Boxes
  await hiveService.openBox<UserModel>(HiveKey.userDataBoxName);

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
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImplementation(apiService: sl<ApiService>()),
  );

  // Cubits
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl<AuthRepo>()));
  //shared pref
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<SharedPref>(
    () => SharedPref(sharedPref: sl<SharedPreferences>()),
  );
  //
  // sl.registerLazySingleton<FirebaseNotification>(() => FirebaseNotification());
  // Replace FirebaseNotification with OneSignalNotificationService
  sl.registerLazySingleton<OneSignalNotificationService>(
    () => OneSignalNotificationService(),
  );
}
