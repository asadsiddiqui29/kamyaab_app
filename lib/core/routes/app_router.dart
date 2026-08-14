import 'package:go_router/go_router.dart';

import '../../features/auth/splash_screen.dart';
import '../../features/auth/onboarding_screen.dart';
import '../../features/auth/login_screen.dart';
import '../../features/auth/otp_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/home/services_screen.dart';
import '../../features/worker/worker_list_screen.dart';
import '../../features/worker/worker_details_screen.dart';
import '../../features/worker/booking_screen.dart';
import '../../features/home/urgent_help_screen.dart';
import '../../features/home/urgent_match_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/splash',

    routes: [
      // SPLASH
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),

      // ONBOARDING
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),

      // LOGIN
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),

      // OTP
      GoRoute(
        path: '/otp',
        builder: (context, state) {
          final phone = state.extra as String;

          return OtpScreen(phone: phone);
        },
      ),

      // HOME
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),

      // URGENT Help
      GoRoute(
        path: '/urgent',
        builder: (context, state) => const UrgentHelpScreen(),
      ),

      GoRoute(
        path: '/urgent/match',
        builder: (context, state) {
         final data = state.extra as Map<String, dynamic>;

        return UrgentMatchScreen(
          service: data['service'] as String,
          problem: data['problem'] as String,
         );
        },
      ),

      // SERVICES
      GoRoute(
        path: '/services',
        builder: (context, state) => const ServicesScreen(),
      ),

      // WORKER LISTING
      GoRoute(
        path: '/workers/:service',
        builder: (context, state) {
          final service =
              state.pathParameters['service'] ?? 'Services';

          return WorkerListingScreen(
            serviceName: service,
          );
        },
      ),

      // WORKER PROFILE
      GoRoute(
        path: '/worker/:id',
        builder: (context, state) {
          final workerName =
              state.pathParameters['id'] ?? 'Selected Worker';

          return WorkerProfileScreen(
            workerName: workerName,
            );
        },
      ),

      // BOOKING FLOW
      GoRoute(
        path: '/booking/:workerId',
        builder: (context, state) {
          final workerId =
              state.pathParameters['workerId'] ?? 'Selected Worker';

          return BookingScreen(
            workerName: workerId,
          );
        },
      ),
    ],
  );
}