// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Change Mode`
  String get ChangeMode {
    return Intl.message('Change Mode', name: 'ChangeMode', desc: '', args: []);
  }

  /// `Change Language`
  String get ChangeLanguage {
    return Intl.message(
      'Change Language',
      name: 'ChangeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Welcome \nBack!\n`
  String get AuthLoginHeaderTitle {
    return Intl.message(
      'Welcome \nBack!\n',
      name: 'AuthLoginHeaderTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create an \naccount`
  String get AuthSignupHeaderTitle {
    return Intl.message(
      'Create an \naccount',
      name: 'AuthSignupHeaderTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create An Account`
  String get CreateAccount {
    return Intl.message(
      'Create An Account',
      name: 'CreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup {
    return Intl.message('Sign Up', name: 'signup', desc: '', args: []);
  }

  /// `Register Successful`
  String get AuthCubitSignupSuccess {
    return Intl.message(
      'Register Successful',
      name: 'AuthCubitSignupSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Login Success`
  String get AuthCubitLoginSuccess {
    return Intl.message(
      'Login Success',
      name: 'AuthCubitLoginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Username or Email`
  String get UsernameorEmail {
    return Intl.message(
      'Username or Email',
      name: 'UsernameorEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get PasswordTextFiled {
    return Intl.message(
      'Password',
      name: 'PasswordTextFiled',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get PasswordTextFiledConfirm {
    return Intl.message(
      'Confirm Password',
      name: 'PasswordTextFiledConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get ForgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'ForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get LoginButtonTitle {
    return Intl.message('Login', name: 'LoginButtonTitle', desc: '', args: []);
  }

  /// `Create Account`
  String get CreateAccountButton {
    return Intl.message(
      'Create Account',
      name: 'CreateAccountButton',
      desc: '',
      args: [],
    );
  }

  /// `- OR Continue with -`
  String get ORContinuewith {
    return Intl.message(
      '- OR Continue with -',
      name: 'ORContinuewith',
      desc: '',
      args: [],
    );
  }

  /// `Create An Account`
  String get OrContinueWithLoginColumnTitle {
    return Intl.message(
      'Create An Account',
      name: 'OrContinueWithLoginColumnTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get OrContinueWithLoginColumnsubtext {
    return Intl.message(
      'Sign Up',
      name: 'OrContinueWithLoginColumnsubtext',
      desc: '',
      args: [],
    );
  }

  /// `'I Already Have an Account'`
  String get OrContinueWithSignupColumnTitle {
    return Intl.message(
      '\'I Already Have an Account\'',
      name: 'OrContinueWithSignupColumnTitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get OrContinueWithSignupColumnsubtext {
    return Intl.message(
      'Login',
      name: 'OrContinueWithSignupColumnsubtext',
      desc: '',
      args: [],
    );
  }

  /// `By clicking the `
  String get RegisterAgreementPart1 {
    return Intl.message(
      'By clicking the ',
      name: 'RegisterAgreementPart1',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get RegisterAgreementButton {
    return Intl.message(
      'Register',
      name: 'RegisterAgreementButton',
      desc: '',
      args: [],
    );
  }

  /// ` button, you agree \nto the public offer`
  String get RegisterAgreementPart2 {
    return Intl.message(
      ' button, you agree \nto the public offer',
      name: 'RegisterAgreementPart2',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
