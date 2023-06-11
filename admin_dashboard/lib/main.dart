// Base packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Utilities
import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/services.dart';
// Http
import 'package:admin_dashboard/api/coffee_api.dart';
// App Layouts
import 'package:admin_dashboard/ui/layouts/layouts.dart';

void main() async {
  await LocalStorage.configurePrefs();
  CoffeeApi.configureDio();
  Flurorouter.configureRoutes();
  runApp(const DashboardDesignState());
}

/// The main entry point for the admin dashboard application.
class DashboardDesignState extends StatelessWidget {
  const DashboardDesignState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => SideMenuProvider()),
        ChangeNotifierProvider(lazy: true, create: (_) => CategoriesProvider()),
        ChangeNotifierProvider(lazy: true, create: (_) => UsersProvider()),
        ChangeNotifierProvider(lazy: true, create: (_) => UpdateUserProvider()),
      ],
      child: const DashboardDesign(),
    );
  }
}

/// The root widget for the admin dashboard.
class DashboardDesign extends StatelessWidget {
  const DashboardDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return MaterialApp(
      title: 'Admin Dashboard',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: NotificationsService.snackbarKey,
      initialRoute: Flurorouter.rootRoute,
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: Flurorouter.router.generator,
      builder: (context, child) {
        final authStatus = authProvider.authStatus;
        return authStatus == AuthStatus.checking
            ? const SplashLayout()
            : authStatus == AuthStatus.authenticated
                ? DashboardLayout(child: child!)
                : AuthLayout(child: child!);
      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(
            Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
