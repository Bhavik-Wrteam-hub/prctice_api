import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_api/cubit/login_cubit.dart';
import 'package:practice_api/data/repository/Login_repo.dart';
import 'package:practice_api/screen/home_screen.dart';
import 'package:practice_api/utils/api.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _HomepageState();
}

class _HomepageState extends State<Auth> {
  TextEditingController grnumber = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    grnumber.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login the sudent"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: grnumber,
          ),
          TextFormField(
            controller: password,
          ),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () async {
                  await context.read<LoginCubit>().signinuser(
                        grnumber: grnumber.text,
                        password: password.text,
                      );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: const Text("Add"),
              );
            },
          ),
        ],
      ),
    );
  }
}
