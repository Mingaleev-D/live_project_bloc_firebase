import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:live_project_bloc_firebase/components/routes/route_pages.dart';
import 'package:live_project_bloc_firebase/ui/blocs/auth/remember_switch_cubit.dart';
import 'package:live_project_bloc_firebase/ui/blocs/auth/sign_up_bloc.dart';
import 'package:live_project_bloc_firebase/ui/screens/widgets/full_width_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                if (state is SignUpInitial) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: state.usernameController,
                          decoration: InputDecoration(
                            label: const Text('Username'),
                            labelStyle: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outlineVariant),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 10.h),
                        TextFormField(
                          controller: state.emailController,
                          decoration: InputDecoration(
                            label: const Text('Email'),
                            labelStyle: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outlineVariant),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 10.h),
                        TextFormField(
                          controller: state.passwordController,
                          decoration: InputDecoration(
                            label: const Text('Password'),
                            labelStyle: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outlineVariant),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Remember me',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                BlocBuilder<RememberSwitchCubit, RememberSwitchState>(
                  builder: (context, state) {
                    return Switch(
                      value: state is SwitchChangedState ? state.value : true,
                      onChanged: (value) {
                        context.read<RememberSwitchCubit>().switchToggle(value);
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: FullWidthButton(
        buttonText: 'Sign Up',
        onTap: () {
          if (_formKey.currentState!.validate()) {}
        },
      ),
    );
  }
}
