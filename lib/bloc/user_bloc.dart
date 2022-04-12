import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutix/models/models.dart';
import 'package:flutix/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadUser>((event, emit) async {
      User user = await UserServices.getUser(event.id);

      emit(UserLoaded(user));
    });

    on<SignOut>((event, emit) => emit(UserInitial()));

    on<UpdateUser>((event, emit) async {
      User updatedUser =
          (state as UserLoaded).user.copyWith(avatar: event.avatar);

      log("Update user to storage");
      await UserServices.updateUser(updatedUser);
      log("Success to update user data");

      User user = await UserServices.getUser(updatedUser.id);

      // emit(UserLoaded(user));
      emit(UserUpdated(user));
    });
  }
}
