part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();

  @override
  List<Object> get props => [];
}

class GoToSplashPage extends PageEvent {}

class GoToLoginPage extends PageEvent {}

class GoToRegisterPage extends PageEvent {
  final RegistrationData? data;

  const GoToRegisterPage(this.data);
}

class GoToMainPage extends PageEvent {}

class GoToProfilingSelectedPage extends PageEvent {
  final RegistrationData? data;

  const GoToProfilingSelectedPage(this.data);
}

class GoToAccountConfirmationPage extends PageEvent {
  final RegistrationData? data;

  const GoToAccountConfirmationPage(this.data);
}
