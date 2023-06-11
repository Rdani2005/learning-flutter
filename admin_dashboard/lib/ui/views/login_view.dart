import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

import 'package:admin_dashboard/providers/providers.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/ui/buttons/buttons.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: _LoginFormBody(),
    );
  }
}

class _LoginFormBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginFormProvider loginFormProvider =
        Provider.of<LoginFormProvider>(context);
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Container(
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 370),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: loginFormProvider.formKey,
            child: Column(
              children: [
                TextFormField(
                  onFieldSubmitted: (_) =>
                      onFormSubmit(loginFormProvider, authProvider),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your Email.";
                    }

                    if (!EmailValidator.validate(value)) {
                      return 'Email not valid.';
                    }

                    return null;
                  },
                  onChanged: (value) => loginFormProvider.email = value,
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInputs.authInputDecoration(
                      hint: 'email@example.com',
                      label: "Email",
                      icon: Icons.email_outlined),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onFieldSubmitted: (_) =>
                      onFormSubmit(loginFormProvider, authProvider),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your password.";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters.";
                    }
                    return null;
                  },
                  onChanged: (value) => loginFormProvider.password = value,
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: CustomInputs.authInputDecoration(
                      hint: '********',
                      label: "Password",
                      icon: Icons.lock_outline_rounded),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomOutlineBtn(
                  onPressed: () =>
                      onFormSubmit(loginFormProvider, authProvider),
                  text: "Login",
                ),
                const SizedBox(
                  height: 20,
                ),
                LinkText(
                  text: "Create Account",
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Flurorouter.registerRoute);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onFormSubmit(
    LoginFormProvider loginFormProvider,
    AuthProvider authProvider,
  ) {
    if (loginFormProvider.validateForm()) {
      authProvider.login(
        loginFormProvider.email,
        loginFormProvider.password,
      );
    }
  }
}
