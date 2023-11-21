import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hw_technical_test_2/blocs/banner_cubit/banner_cubit.dart';
import 'package:hw_technical_test_2/blocs/song_cubit/song_cubit.dart';
import 'package:hw_technical_test_2/services/main_services.dart';

final getIt = GetIt.instance;
Future<void> setupLocator() async {
  // ---------------------------------- CORE -----------------------------------

  // // External
  getIt.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(baseUrl: 'https://customer.holywings.id/')
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (obj) {
            // log(obj.toString(), name: 'NETWORK');
          },
        ),
      ),
  );

  // if (!kIsWeb) {
  //   final appDocDir = await getApplicationDocumentsDirectory();
  //   Hive.init('${appDocDir.path}/db');
  // }

  // getIt.registerLazySingleton<HiveInterface>(() => Hive);
  // getIt.registerLazySingleton(() => FirebaseMessaging.instance);
  // getIt.registerLazySingleton(() => FlutterLocalNotificationsPlugin());
  // getIt.registerLazySingleton(() => BluetoothPrinter());
  // getIt.registerLazySingleton(() => ImagePicker());
  // -------------------------------- END CORE ---------------------------------

  // -------------------------------- SERVICE ----------------------------------
  getIt.registerLazySingleton<MainServices>(
    () => MainServicesImpl(httpClient: getIt()),
  );

  // -------------------------------- END SERVICE ------------------------------

  // --------------------------- STATE MANAGEMENT ------------------------------
  getIt
    ..registerFactory(() => BannerCubit(service: getIt()))
    ..registerFactory(() => SongCubit(service: getIt()));

  // -------------------------- END STATE MANAGEMENT ---------------------------

  // ------------------------------- HELPER ------------------------------------
}
