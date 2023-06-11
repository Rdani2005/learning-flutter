# Services

This directory contains a collection of essential services for the application, designed to handle common tasks related to local storage, navigation, and more. These services facilitate application development by providing an abstraction layer and convenient functionalities for various operations.

## Directory Structure

The Services directory is organized as follows:

-   **services.dart**: This header file imports all the available services in the Services directory for easy usage in the application.

-   **local_storage.dart**: This service encapsulates access to and management of local storage in the application. It provides methods to store, retrieve, and delete data in local storage easily and securely.

-   **navigation_service.dart**: This service offers navigation functionalities within the application. It allows smooth transition between different views, manages route handling, and provides methods to navigate forward, backward, and perform redirections.

-   **notifications_service.dart**: This service provides notification functionalities in the application. It enables sending notifications to the user, managing notification permissions, and customizing notification behavior.

## Usage

To use the services available in this directory, simply import the `services.dart` file in the relevant component or module of your application. Then, you can access the services and their methods to perform the desired operations.

Here's an example of how to use the `LocalStorage` service to store and retrieve data in local storage:

```dart
import 'package:admin_dashboard/services/services.dart';

// Store data
await LocalStorage.prefs.setString('key', keyValue);

// Retrieve data
final value = await LocalStorage.prefs.getString('key');
print(value); // Prints 'value'
```
