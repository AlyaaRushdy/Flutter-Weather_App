import 'package:flutter/material.dart';
import '../../view-models/auth_cubit.dart';
import '../widgets/divider_with_text.dart';
import '../widgets/google_button.dart';
import '../widgets/label_text.dart';
import '../widgets/primary_button.dart';
import '../widgets/text_form_field_decoration.dart';

// ignore: must_be_immutable
class LogIn extends StatelessWidget {
  LogIn({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Form
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10,
            ),
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  //Email
                  const LabelText(text: "Email"),
                  TextFormField(
                    onTapOutside: (PointerDownEvent event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "it must not be empty";
                      }
                      return null;
                    },
                    controller: cubit.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: textFormFieldDecoration(context),
                  ),

                  // Space
                  const SizedBox(height: 15.0),

                  //Password
                  const LabelText(text: "Password"),
                  TextFormField(
                    onTapOutside: (PointerDownEvent event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "it must not be empty";
                      }
                      return null;
                    },
                    controller: cubit.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: textFormFieldDecoration(context),
                  ),

                  // Space
                  const SizedBox(height: 20.0),

                  //Log In Action Button
                  PrimaryButton(
                    text: "Log In",
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        cubit.signInWithEmailAndPassword(context);
                      }
                    },
                  ),

                  //divider with text
                  const DividerWithText(),

                  GoogleButton(formKey: _formKey, cubit: cubit),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
