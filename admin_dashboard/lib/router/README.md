# Router

The `router` directory in the `admin_dashboard` app contains the necessary components for handling routing and defining routes using Fluro.

## Directory Structure

The `router` directory is structured as follows:

-   **admin_handlers**: This directory contains handler functions specific to the admin-related routes. These handlers are responsible for processing the route and performing the necessary actions.

-   **dashboard_handlers**: This directory contains handler functions specific to the dashboard-related routes. These handlers handle the route and execute the required actions.

-   **not_found_handler**: This directory contains a handler function that is triggered when a route is not found. It handles the situation where the user tries to access a route that does not exist.

-   **router.dart**: This file defines all the routes and their corresponding handlers using Fluro. It sets up the router and registers the routes, allowing the application to navigate between different pages based on the defined routes.

## Usage

To use the router and define routes in the `admin_dashboard` app, you need to import the necessary files and set up the router using Fluro. Here's an example of how you can define routes using Fluro in the `router.dart` file:

```dart
import 'package:fluro/fluro.dart';

import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:admin_dashboard/router/not_found_handler.dart';

class Flurorouter {
    static final FluroRouter router = FluroRouter(); // Defining the Flurorouter component
    // Route that you will define.
    static String rootRoute = routeName;


    static void configureRoutes() {

        router.define(
            iconsRoute,
            handler: DashboardHandlers.iconsHandler,
        );
    }
}
```
