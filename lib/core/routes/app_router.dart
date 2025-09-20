import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moltaqa/core/routes/routes_constants.dart';
import 'package:moltaqa/features/auth/ui/auth_redirector.dart';
import 'package:moltaqa/features/auth/ui/auth_screen.dart';
import 'package:moltaqa/features/auth/ui/forgot_password_screen.dart';
import 'package:moltaqa/features/home/ui/online_room/answer_verification_screen.dart';
import 'package:moltaqa/features/home/ui/online_room/leaderboard_screen.dart';
import 'package:moltaqa/features/home/ui/online_room/lobby_screen.dart';
import 'package:moltaqa/features/home/ui/online_room/question_screen.dart';
import 'package:moltaqa/features/moltaqa_nav_bar/bottom_nav_bar_screen.dart';
import 'package:moltaqa/features/home/ui/home_screen.dart';
import 'package:moltaqa/features/packs/ui/packs_screen.dart';
import 'package:moltaqa/features/profile/ui/profile_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellHomeKey = GlobalKey<NavigatorState>(
    debugLabel: 'shell Home',
  );
  static final _shellPacksKey = GlobalKey<NavigatorState>(
    debugLabel: 'shell Packs',
  );
  static final _shellProfileKey = GlobalKey<NavigatorState>(
    debugLabel: 'shell Profile',
  );

  final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
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

      // ONLINE ROOM ROUTES
      GoRoute(
        path: RoutesConstants.lobbyScreen,
        builder: (context, state) => LobbyScreen(),
      ),
      GoRoute(
        path: RoutesConstants.questionScreen,
        builder: (context, state) => QuestionScreen(),
      ),
      GoRoute(
        path: RoutesConstants.leaderboardScreen,
        builder: (context, state) => LeaderboardScreen(),
      ),
      GoRoute(
        path: RoutesConstants.answerVerificationScreen,
        builder: (context, state) => AnswerVerificationScreen(),
      ),

      StatefulShellRoute.indexedStack(
        builder:
            (context, state, navigationShell) =>
                MoltaqaScaffoldWithNavBar(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellHomeKey,
            routes: [
              GoRoute(
                path: RoutesConstants.homeScreen,
                builder: (context, state) => HomeScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _shellPacksKey,
            routes: [
              GoRoute(
                path: RoutesConstants.packsScreen,
                builder: (context, state) => PacksScreen(),
                routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellProfileKey,
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
