import 'package:admin_dashboard/providers/providers.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/buttons.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: _RegisterFormBody(),
    );
  }
}

class _RegisterFormBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RegisterFormProvider registerFormProvider =
        Provider.of<RegisterFormProvider>(context);
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 370),
          child: Form(
            key: registerFormProvider.formKey,
            child: Column(
              children: [
                TextFormField(
                  onFieldSubmitted: (_) =>
                      onFormSubmit(registerFormProvider, authProvider),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name Required.";
                    }
                    return null;
                  },
                  onChanged: (value) => registerFormProvider.name = value,
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInputs.authInputDecoration(
                    hint: 'John',
                    label: "Name",
                    icon: Icons.people_outline,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your Email.";
                    }

                    if (!EmailValidator.validate(value)) {
                      return 'Email not valid.';
                    }

                    return null;
                  },
                  onChanged: (value) => registerFormProvider.email = value,
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
                      onFormSubmit(registerFormProvider, authProvider),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your password.";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters.";
                    }
                    return null;
                  },
                  onChanged: (value) => registerFormProvider.password = value,
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
                      onFormSubmit(registerFormProvider, authProvider),
                  text: "Create Account",
                ),
                const SizedBox(
                  height: 20,
                ),
                LinkText(
                  text: "Login",
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Flurorouter.loginRoute);
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
    RegisterFormProvider registerFormProvider,
    AuthProvider authProvider,
  ) {
    if (registerFormProvider.validateForm()) {
      authProvider.register(
        registerFormProvider.name,
        registerFormProvider.email,
        registerFormProvider.password,
      );
    }
  }
}
