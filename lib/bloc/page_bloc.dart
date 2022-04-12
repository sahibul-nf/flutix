import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutix/models/registration_data.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnInitialPage()) {
    on<GoToSplashPage>((event, emit) => emit(OnSplashPage()));
    on<GoToLoginPage>((event, emit) => emit(OnLoginPage()));
    on<GoToRegisterPage>((event, emit) {
      RegistrationData? data = event.data;

      emit(OnRegisterPage(data));
    });
    on<GoToMainPage>((event, emit) => emit(OnMainPage()));
    on<GoToProfilingSelectedPage>((event, emit) {
      RegistrationData? data = event.data;

      emit(OnProfilingSelectedPage(data));
    });
    on<GoToAccountConfirmationPage>((event, emit) {
      RegistrationData? data = event.data;

      emit(OnAccountConfirmationPage(data));
    });
  }
}
