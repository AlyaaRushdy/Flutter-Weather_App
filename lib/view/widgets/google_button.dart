import 'package:flutter/material.dart';
import '../../view-models/auth_cubit.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.cubit,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        _formKey.currentState!.save();
        cubit.signInWithGoogle(context);
      },
      icon: Image.asset(
        "assets/images/google.png",
        width: 30,
      ),
      label: const Text('Continue with Google'),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.grey),
      ),
    );
  }
}
