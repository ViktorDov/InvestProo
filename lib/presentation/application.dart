import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investpro/presentation/screens/auth/login/cubit/login_cubit.dart';
import 'package:investpro/presentation/screens/auth/registration/cubit/registration_cubit.dart';
import 'package:investpro/presentation/screens/tips/cubit/tips_cubit.dart';

import 'screens/tips/tips_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      //11500
      providers: [
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider<RegistrationCubit>(
          create: (BuildContext context) => RegistrationCubit(),
        ),
        BlocProvider<TipsCubit>(
          create: (BuildContext context) => TipsCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: const TipsScreen(),
      ),
    );
  }
}
