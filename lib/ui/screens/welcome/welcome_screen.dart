import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:live_project_bloc_firebase/components/routes/route_pages.dart';
import 'package:live_project_bloc_firebase/ui/screens/widgets/full_width_button.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Welcome",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Lets get started',
              style: Theme.of(context).textTheme.titleLarge),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SocialLoginButton(
                  buttonType: SocialLoginButtonType.apple,
                  onPressed: () {},
                ),
                SizedBox(height: 10.h),
                SocialLoginButton(
                  buttonType: SocialLoginButtonType.github,
                  onPressed: () {},
                ),
                SizedBox(height: 10.h),
                SocialLoginButton(
                  buttonType: SocialLoginButtonType.google,
                  onPressed: () {},
                )
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have ac account?',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface)),
                  TextButton(
                      onPressed: () {
                        context.pushNamed(Routes.LOGIN_ROUTE);
                      },
                      child: Text(
                        'Sign in',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ))
                ],
              ),
              FullWidthButton(
                buttonText: 'Create an account',
                onTap: () {
                  context.pushNamed(Routes.REGISTER_ROUTE);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
