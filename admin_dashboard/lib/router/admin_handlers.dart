import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:fluro/fluro.dart';

import 'package:admin_dashboard/ui/views/views.dart';
import 'package:provider/provider.dart';

class AdminHandlers {
  static final loginHandler = Handler(
    handlerFunc: (context, params) {
      final AuthProvider authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.notauthenticated) {
        return const LoginView();
      } else {
        return const DashboardView();
      }
    },
  );

  static final registerHandler = Handler(
    handlerFunc: (context, params) {
      final AuthProvider authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.notauthenticated) {
        return const RegisterView();
      } else {
        return const DashboardView();
      }
    },
  );
}
