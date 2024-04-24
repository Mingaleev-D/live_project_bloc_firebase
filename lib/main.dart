import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_project_bloc_firebase/data/repository/auth_repository.dart';
import 'package:live_project_bloc_firebase/simple_bloc_observer.dart';
import 'package:live_project_bloc_firebase/ui/blocs/auth/login_bloc.dart';
import 'package:live_project_bloc_firebase/ui/blocs/auth/remember_switch_cubit.dart';
import 'package:live_project_bloc_firebase/ui/blocs/auth/sign_up_bloc.dart';

import 'components/routes/route_pages.dart';
import 'components/theme/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<RememberSwitchCubit>(
              create: (context) => RememberSwitchCubit()),
          BlocProvider<SignUpBloc>(create: (context) => SignUpBloc()),
          BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(context.read<AuthRepository>())),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp.router(
              theme: const MaterialTheme(TextTheme()).light(),
              darkTheme: const MaterialTheme(TextTheme()).dark(),
              debugShowCheckedModeBanner: false,
              routerConfig: RoutePages.ROUTER,
            );
          },
        ),
      ),
    );
  }
}
