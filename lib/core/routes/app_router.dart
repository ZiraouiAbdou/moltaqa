import 'package:go_router/go_router.dart';
import 'package:moltaqa/core/routes/routes_constants.dart';
import 'package:moltaqa/features/auth/ui/auth_redirector.dart';
import 'package:moltaqa/features/auth/ui/auth_screen.dart';
import 'package:moltaqa/features/home/home.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RoutesConstants.authRedirector,
        builder: (context, state) => AuthRedirector(),
      ),
      GoRoute(
        path: RoutesConstants.authScreen,
        builder: (context, state) => AuthScreen(),
      ),
      GoRoute(
        path: RoutesConstants.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),
    ],
  );
}
