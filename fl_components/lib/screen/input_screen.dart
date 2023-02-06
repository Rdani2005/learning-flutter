import 'package:flutter/material.dart';

import 'package:fl_components/widgets/widgets.dart' show CustomTextField;

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {};

    return Scaffold(
        appBar: AppBar(
          title: const Text('Inputs y Forms'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: formKey,
              onChanged: () {},
              child: Column(children: [
                CustomTextField(
                  labelText: 'Nombre',
                  hintText: 'Username',
                  formProperty: 'first_name',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  labelText: 'Apellido',
                  hintText: 'Apellidos',
                  formProperty: 'last_name',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  labelText: 'Correo',
                  hintText: 'example@email.com',
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'email',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  labelText: 'Contraseña',
                  hintText: 'Contraseña de usuario',
                  isPassword: true,
                  formProperty: 'password',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(
                      value: 'Admin',
                      child: Text('Admin'),
                    ),
                    DropdownMenuItem(
                      value: 'Superuser',
                      child: Text('Super Usuario'),
                    ),
                    DropdownMenuItem(
                      value: 'Normal',
                      child: Text('Usuario normal'),
                    ),
                  ],
                  onChanged: (value) {
                    print(value);
                    formValues['role'] = value ?? 'Admin';
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      // Imprimir valores del formulario
                      if (!formKey.currentState!.validate()) {
                        print('Not valid!');
                        return;
                      }
                    },
                    child: const SizedBox(
                        width: double.infinity,
                        child: Center(child: Text('Guardar')))),
              ]),
            ),
          ),
        ));
  }
}
