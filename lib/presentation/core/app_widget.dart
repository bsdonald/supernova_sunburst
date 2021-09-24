import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supernova_sunburst/application/auth/auth_bloc.dart';
import 'package:supernova_sunburst/injection.dart';
import 'package:supernova_sunburst/presentation/routes/router.gr.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        ),
        // BlocProvider<CharacterFormBloc>(create: (context) => getIt<CharacterFormBloc>()),
      ],
      child: MaterialApp.router(
        routerDelegate: AutoRouterDelegate(_appRouter),
        routeInformationParser: _appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
        title: "Shattered Star Player's Guide",
        theme: ThemeData.light().copyWith(
          // primaryColor: colors.lightBlue,
          // accentColor: colors.darkOrange,
          // scaffoldBackgroundColor: colors.lightGrey,
          // cardColor: colors.blueGreen,
          cardTheme: const CardTheme(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              // backgroundColor: colors.lightOrange,
              ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
