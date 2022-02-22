import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnInitialPage()) {
    on<GoToSplashPage>((event, emit) => emit(OnSplashPage()));
    on<GoToLoginPage>((event, emit) => emit(OnLoginPage()));
    on<GoToRegisterPage>((event, emit) => emit(OnRegisterPage()));
    on<GoToMainPage>((event, emit) => emit(OnMainPage()));
  }
}
