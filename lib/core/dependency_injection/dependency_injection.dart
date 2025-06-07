import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // // auth
  // getIt.registerLazySingleton<LoginRepository>(
  //   () => LoginRepository(apiService: getIt()),
  // );
  // getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
