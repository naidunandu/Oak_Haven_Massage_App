import 'package:get/get.dart';
import 'package:oak_haven_massage_app/routes/route_name.dart';

import '../view/feed/create_post.dart';
import '../view/layout.dart';
import '../view/login.dart';
import '../view/more/feedback.dart';
import '../view/more/loan.dart';
import '../view/more/maintenance.dart';
import '../view/more/payroll.dart';
import '../view/more/pto_request.dart';
import '../view/otp.dart';
import '../view/splash.dart';
import '../view/home.dart';

class AppRoutes {
  static GetPage<dynamic> getPage({
    required String name,
    required GetPageBuilder page,
    List<GetMiddleware>? middlewares,
  }) {
    return GetPage(
      name: name,
      page: page,
      transition: Transition.topLevel,
      showCupertinoParallax: true,
      middlewares: middlewares ?? [],
      transitionDuration: 350.milliseconds,
    );
  }

  static List<GetPage> pages = [
    getPage(name: RouteNames.splash, page: () => const SplashView()),
    getPage(name: RouteNames.home, page: () => const HomeView()),
    getPage(name: RouteNames.login, page: () => const LoginView()),
    getPage(name: RouteNames.otp, page: () => const OtpView()),
    getPage(name: RouteNames.layout, page: () => const LayoutView()),
    getPage(name: RouteNames.feedback, page: () => const FeedbackView()),
    getPage(name: RouteNames.maintenance, page: () => const MaintenanceView()),
    getPage(name: RouteNames.pTORequest, page: () => const PTORequestView()),
    getPage(name: RouteNames.loan, page: () => const LoanView()),
    getPage(name: RouteNames.payroll, page: () => const PayRollView()),
    getPage(name: RouteNames.createPost, page: () => const CreatePostView()),
  ];
}
