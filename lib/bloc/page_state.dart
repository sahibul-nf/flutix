part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();

  @override
  List<Object> get props => [];
}

class OnInitialPage extends PageState {}

class OnMainPage extends PageState {}

class OnLoginPage extends PageState {}

class OnRegisterPage extends PageState {
  final RegistrationData? data;

  const OnRegisterPage(this.data);
}

class OnSplashPage extends PageState {}

class OnProfilingSelectedPage extends PageState {
  final RegistrationData? data;

  const OnProfilingSelectedPage(this.data);
}

class OnAccountConfirmationPage extends PageState {
  final RegistrationData? data;

  const OnAccountConfirmationPage(this.data);
}
