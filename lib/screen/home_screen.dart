import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_api/cubit/login_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "this is the Home Screen",
        ),
      ),
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                color: Colors.amber,
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    if (state is LoginstateInSussess) {
                      return Container(
                        child: Text(
                          state.student['data']['class_section']['medium']
                                  ['name']
                              .toString(),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
