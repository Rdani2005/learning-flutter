import 'package:flutter/material.dart';
import 'package:products_app/screens/screens.dart';
import 'package:products_app/services/services.dart';
import 'package:provider/provider.dart';

class CheckScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService authService =
        Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.isAuthenticaded(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) {
              return const Text("Espere");
            }

            if (snapshot.data == '') {
              Future.microtask(() {
                // Navigator.of(context).pushReplacementNamed('home');
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => LoginScreen(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              });
            } else {
              Future.microtask(() {
                // Navigator.of(context).pushReplacementNamed('home');
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => HomeScreen(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              });
            }

            return Container();
          },
        ),
      ),
    );
  }
}
