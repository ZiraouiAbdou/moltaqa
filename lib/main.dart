import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moltaqa/core/dependency_injection/dependency_injection.dart';
import 'package:moltaqa/core/routes/app_router.dart';
import 'package:moltaqa/firebase_options.dart';
import 'package:moltaqa/moltaqa_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ScreenUtil.ensureScreenSize();
  await setupGetIt();
  runApp(MoltaqaApp(appRouter: AppRouter()));
}
