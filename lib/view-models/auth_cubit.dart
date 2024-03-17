import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:weather_app/view/screens/tabs_bar.dart';
import '../view/screens/home_page.dart';
import 'google.dart';
part 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  late String name, email, password;

  void signInWithEmailAndPassword(BuildContext context) {
    emit(SignInLoadingState());

    email = emailController.text;
    password = passwordController.text;

    try {
      _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        emit(SignInSuccessState());

        name = email.split("@")[0];
        clearControllers();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }).catchError((error) {
        emit(SignInErrorState());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      });
    } catch (e) {
      log(e.toString());
    }
  }

  void registerWithEmailAndPassword(BuildContext context) {
    emit(SignUpLoadingState());

    name = "${firstNameController.text} ${lastNameController.text}";
    email = emailController.text;
    password = passwordController.text;

    try {
      _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        emit(SignUpSuccessState());

        clearControllers();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }).catchError((error) {
        emit(SignUpErrorState());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      });
    } catch (e) {
      log(e.toString());
    }
  }

  void signInWithGoogle(BuildContext context) {
    emit(GoogleSignInLoadingState());

    try {
      signInWithGoogleCredentials().then((value) async {
        emit(GoogleSignInSuccessState());
        name = value.user!.displayName!;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }).catchError((error) {
        emit(GoogleSignInErrorState());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> signOut(BuildContext context) async {
    emit(SignOutLoadingState());

    try {
      await GoogleSignIn().signOut();
      _auth.signOut().then((value) async {
        emit(SignOutSuccessState());

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const TabsBar(),
          ),
        );
      }).catchError((error) {
        emit(SignOutErrorState());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      });
    } catch (e) {
      log(e.toString());
    }
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
    passwordConfirmController.clear();
    firstNameController.clear();
    lastNameController.clear();
  }
}
