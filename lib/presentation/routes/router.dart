import 'package:auto_route/auto_route.dart';
import 'package:supernova_sunburst/presentation/pages/sign_in/sign_in_page.dart';

@MaterialAutoRouter(    
  replaceInRouteName: 'Page,Route',    
  routes: <AutoRoute>[    
    AutoRoute(page: SignInPage, initial: true),    
  ],    
)    
class $AppRouter {}    