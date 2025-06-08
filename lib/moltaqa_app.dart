import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moltaqa/core/routes/app_router.dart';
import 'package:moltaqa/features/auth/data/repos/auth_repo.dart';
import 'package:moltaqa/features/auth/logic/cubit/auth_cubit.dart';

class MoltaqaApp extends StatelessWidget {
  final AppRouter appRouter;
  const MoltaqaApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      child: BlocProvider(
        create: (context) => AuthCubit(AuthRepository()),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Moltaqa',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),

          routeInformationParser: appRouter.router.routeInformationParser,
          routeInformationProvider: appRouter.router.routeInformationProvider,
          routerDelegate: appRouter.router.routerDelegate,
        ),
      ),
    );
  }
}
