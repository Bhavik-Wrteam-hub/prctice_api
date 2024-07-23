import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_api/cubit/login_cubit.dart';
import 'package:practice_api/screen/Auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: Auth(),
      ),
    );
  }
}
