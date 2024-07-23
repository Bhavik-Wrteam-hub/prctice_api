// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:practice_api/data/repository/Login_repo.dart';
import 'package:practice_api/utils/api.dart';

abstract class LoginState {}

class LoginstateInit extends LoginState {}

class LoginstateInProgresh extends LoginState {}

class LoginstateInSussess extends LoginState {
  final bool isStudentLogIn;
  final Map<String, dynamic> student;
  LoginstateInSussess({required this.student, required this.isStudentLogIn});
}

class LoginstateInError extends LoginState {
  String error;
  LoginstateInError({
    required this.error,
  });
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginstateInit());

  Future signinuser(
      {required String grnumber, required String password}) async {
    emit(LoginstateInProgresh());
    try {
      // late Map<String, dynamic> result;

      final result = await Authrepo.loginrepo(
        grnumber: grnumber,
        password: password,
      );
      emit(
        LoginstateInSussess(isStudentLogIn: false, student: result),
      );
      print('this is the cubit data');
      print(result);
    } catch (e) {
      LoginstateInError(error: e.toString());
      ApiException(e.toString());
    }
  }
}
