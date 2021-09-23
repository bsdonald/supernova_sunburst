import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supernova_sunburst/application/auth/sign_in_form/sign_in_form_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              final snackBar = SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text(
                  failure.map(
                    cancelledByUser: (_) => 'Cancelled',
                    invalidEmailAndPasswordCombination: (_) => 'Invalid email and password combination',
                    serverError: (_) => 'Server error',
                    emailAlreadyInUse: (_) => 'Email already in use',
                  ),
                ),
                action: SnackBarAction(
                  label: 'Action',
                  onPressed: () {},
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            (_) {
              print('sign in');
            },
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                height: 250,
                child: Image.asset('assets/images/DWD.png'),
              ),
              const SizedBox(height: 8),
              TextFormField(
                onChanged: (value) => context.read<SignInFormBloc>().add(SignInFormEvent.emailChanged(value)),
                validator: (_) => context.read<SignInFormBloc>().state.emailAddress.value.fold(
                      (f) => f.maybeMap(
                        invalidEmail: (_) => 'Invalid Email',
                        orElse: () => null,
                      ),
                      (_) => null,
                    ),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                  hintText: 'youremail@email.com',
                ),
                autocorrect: false,
              ),
              const SizedBox(height: 8),
              TextFormField(
                onChanged: (value) => context.read<SignInFormBloc>().add(SignInFormEvent.passwordChanged(value)),
                validator: (_) => context.read<SignInFormBloc>().state.password.value.fold(
                      (f) => f.maybeMap(
                        shortPassword: (_) => 'Password is Too Short',
                        orElse: () => null,
                      ),
                      (_) => null,
                    ),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
                autocorrect: false,
                obscureText: true,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context.read<SignInFormBloc>().add(
                              const SignInFormEvent.signInWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text('SIGN IN'),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context.read<SignInFormBloc>().add(
                              const SignInFormEvent.registerWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text('REGISTER'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  context.read<SignInFormBloc>().add(
                        const SignInFormEvent.signInWithGooglePressed(),
                      );
                },
                child: const Text(
                  'SIGN IN WITH GOOGLE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (state.isSubmitting) ...[
                const SizedBox(height: 8),
                const LinearProgressIndicator(
                  value: null,
                ),
              ]
            ],
          ),
        );
      },
    );
  }
}
