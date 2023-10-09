import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/const/text_constants.dart';
import '../../core/service/user_service.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(ChangePasswordInitial());

  @override
  Stream<ChangePasswordState> mapEventToState(
    ChangePasswordEvent event,
  ) async* {
    if (event is ChangePassword) {
      yield ChangePasswordProgress();
      try {
        yield ChangePasswordSuccess(message: TextConstants.passwordUpdated);
        await Future.delayed(Duration(seconds: 1));
        yield ChangePasswordInitial();
      } catch (e) {
        yield ChangePasswordError(e.toString());
        await Future.delayed(Duration(seconds: 1));
        yield ChangePasswordInitial();
      }
    }
  }
}
