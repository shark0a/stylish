part of 'auth_cubit.dart';

@immutable
abstract class AuthCubitState {}

class AuthCubitInitial extends AuthCubitState {}

class AuthCubitLoading extends AuthCubitState {}

class AuthCubitSuccess extends AuthCubitState {}

class AuthCubitFailure extends AuthCubitState {
  final String errMessage;

  AuthCubitFailure({required this.errMessage});

  @override
  String toString() => 'AuthCubitFailure: $errMessage';
}

class AuthCubitThemeChanged extends AuthCubitState {
  final ThemeMode themeMode;

  AuthCubitThemeChanged(this.themeMode);

  @override
  String toString() => 'AuthCubitThemeChanged: $themeMode';
}

class AuthCubitLocaleChanged extends AuthCubitState {
  final Locale locale;

  AuthCubitLocaleChanged(this.locale);

  @override
  String toString() => 'AuthCubitLocaleChanged: $locale';
}
