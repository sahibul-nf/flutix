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
  }
}
