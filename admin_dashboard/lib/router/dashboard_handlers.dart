import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/ui/views/views.dart';

class DashboardHandlers {
  // Main Handler
  static final mainHandler = Handler(
    handlerFunc: (context, params) {
      final AuthProvider authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context)
          .setCurrentPage(Flurorouter.dashboardRoute);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const DashboardView();
      } else {
        return const LoginView();
      }
    },
  );

  // Icons Handler
  static final iconsHandler = Handler(
    handlerFunc: (context, params) {
      final AuthProvider authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context)
          .setCurrentPage(Flurorouter.iconsRoute);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const IconsView();
      } else {
        return const LoginView();
      }
    },
  );
  // Blank View Handler
  static final blankHandler = Handler(
    handlerFunc: (context, params) {
      final AuthProvider authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context)
          .setCurrentPage(Flurorouter.blankRoute);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const BlankView();
      } else {
        return const LoginView();
      }
    },
  );
  // Categories Handler
  static final categoriesHandler = Handler(
    handlerFunc: (context, params) {
      final AuthProvider authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context)
          .setCurrentPage(Flurorouter.categoriesRoute);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const CategoriesView();
      } else {
        return const LoginView();
      }
    },
  );

  // Users Handlers
  static final usersHandler = Handler(
    handlerFunc: (context, params) {
      final AuthProvider authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context)
          .setCurrentPage(Flurorouter.usersRoute);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const UsersView();
      } else {
        return const LoginView();
      }
    },
  );

  static final singleUserHandler = Handler(
    handlerFunc: (context, params) {
      final AuthProvider authProvider = Provider.of<AuthProvider>(context!);
      final sideMenuProvider = Provider.of<SideMenuProvider>(context);
      sideMenuProvider.setCurrentPage(Flurorouter.singleUserRoute);

      if (authProvider.authStatus != AuthStatus.authenticated) {
        return const LoginView();
      }

      final uid = params['uid']?.first;

      if (uid != null) {
        return SingleUserView(uid: uid);
      } else {
        return const UsersView();
      }
    },
  );
}
