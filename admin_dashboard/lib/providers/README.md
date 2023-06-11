# Providers

The `providers` directory contains the necessary provider classes for state management within the application. These providers facilitate the management and sharing of data across different components and screens.

## Directory Structure

The `providers` directory is structured as follows:

-   **auth_provider.dart**: This file defines the `AuthProvider` class, which handles authentication-related state management. It provides methods and properties for managing user authentication, such as login, logout, and user information.

-   **login_form_provider.dart**: This file defines the `LoginFormProvider` class, which manages the state of the login form. It provides methods and properties to validate form inputs, handle form submission, and track form-related state.

-   **register_form_provider.dart**: This file defines the `RegisterFormProvider` class, which manages the state of the registration form. It handles form validation, submission, and tracks form-related state changes.

-   **sidemenu_provider.dart**: This file defines the `SideMenuProvider` class, which manages the state of the side menu. It provides methods and properties to handle menu item selection, track active menu items, and update menu state.

-   **providers.dart**: This file serves as an entry point for importing all the provider classes. It imports and exports the provider files, making them easily accessible throughout the application.

## Usage

To use the providers available in this directory, import the `providers.dart` file in the relevant components or modules of your application. Then, you can access the desired provider and utilize its methods and properties to manage state and data.

Here's an example of how to use the `AuthProvider` to handle authentication:

```dart
import 'package:admin_dashboard/providers/providers.dart';

final authProvider = AuthProvider();

// Login
authProvider.login(email, password);

// Logout
authProvider.logout();

// Access user information
final user = authProvider.user;
print(user.name); // Prints the user's name
```
