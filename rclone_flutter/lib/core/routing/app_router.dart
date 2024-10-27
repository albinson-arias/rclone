import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rclone_flutter/core/routing/app_routes.dart';
import 'package:rclone_flutter/main.dart';
import 'package:rclone_flutter/presentation/cubits/color_cubit/color_cubit.dart';
import 'package:rclone_flutter/presentation/cubits/pixels_cubit/pixels_cubit.dart';
import 'package:rclone_flutter/presentation/screens/board_screen.dart';
import 'package:rclone_flutter/presentation/screens/splash_screen.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    if (!showedSplash) {
      return '/splash';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/splash',
      name: AppRoutes.splash.name,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/',
      name: AppRoutes.board.name,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => PixelsCubit(client),
          ),
          BlocProvider(
            create: (context) => ColorCubit(),
          ),
        ],
        child: const BoardScreen(),
      ),
    ),
  ],
);
