import 'package:auto_route/auto_route.dart';
import 'package:supernova_sunburst/presentation/pages/home_page/home_page.dart';
import 'package:supernova_sunburst/presentation/pages/sign_in/sign_in_page.dart';
import 'package:supernova_sunburst/presentation/pages/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: SignInPage),
    AutoRoute(page: HomePage),
  ],
)
class $AppRouter {}
