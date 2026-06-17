import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final appRoter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        return HomeScreen();
      },
      routes: [
        GoRoute(
          path: '/movie/:id',
          builder: (context, state) {
            final movieId = state.pathParameters['page'] ?? '0';
            return MovieScreen(movieId: movieId);
          },
        ),
      ],
    ),
  ],
);
