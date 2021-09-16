import 'package:auto_route/auto_route.dart';
import 'package:supernova_sunburst/presentation/pages/home_page/home_page.dart';

@MaterialAutoRouter(    
  replaceInRouteName: 'Page,Route',    
  routes: <AutoRoute>[    
    AutoRoute(page: HomePage, initial: true),    
  ],    
)    
class $AppRouter {}    