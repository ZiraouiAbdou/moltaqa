import 'package:go_router/go_router.dart';
import 'package:moltaqa/features/auth/ui/auth_screen.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(path: '/', builder: (context, state) => AuthScreen()),
    ],
  );
}
