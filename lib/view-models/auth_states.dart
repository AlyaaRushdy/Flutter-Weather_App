part of 'auth_cubit.dart';

abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class SignInLoadingState extends AuthStates {}

class SignInSuccessState extends AuthStates {}

class SignInErrorState extends AuthStates {}

class SignUpLoadingState extends AuthStates {}

class SignUpSuccessState extends AuthStates {}

class SignUpErrorState extends AuthStates {}

class SignOutLoadingState extends AuthStates {}

class SignOutSuccessState extends AuthStates {}

class SignOutErrorState extends AuthStates {}

class GoogleSignInLoadingState extends AuthStates {}

class GoogleSignInSuccessState extends AuthStates {}

class GoogleSignInErrorState extends AuthStates {}
