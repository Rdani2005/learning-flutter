import 'package:fluro/fluro.dart';

import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:admin_dashboard/router/not_found_handler.dart';

/// Define all Routes stuff on the App.
/// Usage:
///   $ Flurorouter.router --> Gets the router instance
///   $ Flurorouter.routeName --> Gets the route name
///   $ Flurorouter.configureRoutes --> Configure all routes available on the app.
class Flurorouter {
  static final FluroRouter router = FluroRouter();
  // Root route
  static String rootRoute = "/";
  // Auth Router
  static String loginRoute = "/auth/login";
  static String registerRoute = "/auth/register";
  // Dashboard Router
  static String dashboardRoute = "/dashboard";
  static String iconsRoute = "/dashboard/icons";
  static String blankRoute = "/dashboard/blank";
  static String categoriesRoute = "/dashboard/categories";
  // Users
  static String usersRoute = "/dashboard/users";
  static String singleUserRoute = "/dashboard/users/:uid";

  /// Configuring all routes on the app
  static void configureRoutes() {
    // Authentication Routes
    router.define(
      rootRoute,
      handler: AdminHandlers.loginHandler,
      transitionType: TransitionType.none,
    );
    router.define(
      loginRoute,
      handler: AdminHandlers.loginHandler,
      transitionType: TransitionType.none,
    );

    router.define(
      registerRoute,
      handler: AdminHandlers.registerHandler,
      transitionType: TransitionType.none,
    );

    // Dashboard routes
    router.define(
      dashboardRoute,
      handler: DashboardHandlers.mainHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      iconsRoute,
      handler: DashboardHandlers.iconsHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      blankRoute,
      handler: DashboardHandlers.blankHandler,
      transitionType: TransitionType.fadeIn,
    );
    // Categories Routes
    router.define(
      categoriesRoute,
      handler: DashboardHandlers.categoriesHandler,
      transitionType: TransitionType.fadeIn,
    );

    // Users routes
    router.define(
      usersRoute,
      handler: DashboardHandlers.usersHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      singleUserRoute,
      handler: DashboardHandlers.singleUserHandler,
      transitionType: TransitionType.fadeIn,
    );
    // Not Found
    router.notFoundHandler = NotFoundHandlers.notFoundHandler;
  }
}
