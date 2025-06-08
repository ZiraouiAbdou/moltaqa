import 'package:go_router/go_router.dart';
import 'package:moltaqa/core/routes/routes_constants.dart';
import 'package:moltaqa/features/auth/ui/auth_redirector.dart';
import 'package:moltaqa/features/auth/ui/auth_screen.dart';
import 'package:moltaqa/features/auth/ui/forgot_password_screen.dart';
import 'package:moltaqa/features/moltaqa_nav_bar/bottom_nav_bar_screen.dart';
import 'package:moltaqa/features/home/ui/home_screen.dart';
import 'package:moltaqa/features/packs/ui/packs_screen.dart';
import 'package:moltaqa/features/profile/ui/profile_screen.dart';

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
        path: RoutesConstants.forgotPassword,
        builder: (context, state) => ForgotPasswordScreen(),
      ),

      // GoRoute(
      //   path: RoutesConstants.homeScreen,
      //   builder: (context, state) => HomeScreen(),
      // ),
      StatefulShellRoute.indexedStack(
        builder:
            (context, state, navigationShell) =>
                MoltaqaScaffoldWithNavBar(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutesConstants.homeScreen,
                builder: (context, state) => HomeScreen(),
                routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutesConstants.packsScreen,
                builder: (context, state) => PacksScreen(),
                routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutesConstants.profileScreen,
                builder: (context, state) => ProfileScreen(),
                routes: [],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
