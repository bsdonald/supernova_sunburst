import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supernova_sunburst/application/auth/auth_bloc.dart';
import 'package:supernova_sunburst/presentation/pages/home_page/widgets/home_page_body.dart';
import 'package:supernova_sunburst/presentation/routes/router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeMap(
          unauthenticated: (_) => AutoRouter.of(context).replace(const SignInRoute()),
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              context.read<AuthBloc>().add(const AuthEvent.signedOut());
            },
          ),
          title: Text('Hello World!'),
        ),
        body: HomePageBody(),
      ),
    );
  }
}
