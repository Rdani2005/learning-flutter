import 'package:flutter/material.dart';
import 'package:products_app/providers/providers.dart';
import 'package:products_app/services/services.dart';
import 'package:products_app/ui/input_decorations.dart';
import 'package:products_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 250,
          ),
          CardContainer(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Crear Cuenta",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 30,
                ),
                ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(),
                  child: _LoginForm(),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          TextButton(
            style: ButtonStyle(
              overlayColor:
                  MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
              shape: MaterialStateProperty.all(const StadiumBorder()),
            ),
            onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
            child: const Text(
              "Ya tienes una cuenta?",
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginForm.formKey,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: "example@email.com",
                labelText: "Correo Electronico",
                prefixIcon: Icons.alternate_email_rounded),
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);

              return regExp.hasMatch(value ?? '')
                  ? null
                  : "Digite un correo válido";
            },
            onChanged: (value) => loginForm.email = value,
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            decoration: InputDecorations.authInputDecoration(
                hintText: "Contraseña Segura",
                labelText: "Contraseña",
                prefixIcon: Icons.lock_outline),
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : "La contraseña tiene que tener 6 caracteres";
            },
            onChanged: (value) => loginForm.password = value,
          ),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(
            onPressed: loginForm.isLoading
                ? null
                : () async {
                    if (!loginForm.isValidForm()) return;
                    loginForm.isLoading = true;

                    final AuthService authService =
                        Provider.of<AuthService>(context, listen: false);
                    final String? errorMsg = await authService.createUser(
                        loginForm.email, loginForm.password);

                    if (errorMsg == null) {
                      Navigator.pushReplacementNamed(context, 'home');
                    } else {
                      loginForm.isLoading = false;
                    }
                  },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.deepPurple,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: const Text(
                'Ingresar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
