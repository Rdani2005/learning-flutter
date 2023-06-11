# UI

This directory contains a collection of UI components and styles for the application. It is organized into several subdirectories, each serving a specific purpose in building the user interface.

## Directory Structure

The UI directory is structured as follows:

-   **buttons**: This directory contains reusable button components and styles that can be used throughout the application. It provides different button variations, sizes, and styles to suit various design requirements.

-   **cards**: This directory includes components and styles for creating card-based layouts. It provides pre-designed card components that can be easily customized and used to display information or group related content.

-   **inputs**: This directory contains input components and styles for capturing user input. It offers a range of input fields, such as text fields, dropdowns, checkboxes, and more, along with corresponding styles for consistent and visually appealing forms.

-   **layouts**: This directory provides layout components and styles for structuring the application's user interface. It includes different layout options, such as grids, columns, and responsive layouts, to help organize and arrange UI elements effectively.

-   **shared**: The shared directory holds shared UI components, styles, or utilities that can be used across multiple sections of the application. It promotes code reuse and consistency in UI design and functionality.

-   **views**: This directory contains specific views or screens of the application. It may include components, styles, and templates that are unique to each view, providing a clear separation of concerns and easy navigation between different sections of the app.

## Usage

To use the UI components and styles available in this directory, simply import the specific component or style file into your application's code. For example, if you want to use a button from the "buttons" directory, import the button component from that directory and use it in your desired location.

Here's an example of how to use a button from the "buttons" directory:

```dart
import 'package:admin_dashboard/ui/buttons/buttons.dart';


    return Container(
      height: (size.width > 1000) ? size.height * 0.07 : null,
      color: Colors.black,
      child: const Wrap(
        alignment: WrapAlignment.center,
        children: [
            // Use the Link Button component
          LinkText(text: 'about'),
        ],
      ),
    );
```
