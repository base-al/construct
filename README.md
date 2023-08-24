
# Construct Framework

The Construct framework is a powerful Dart-based MVC framework designed for building robust and scalable web applications. It provides a structured architecture and a set of tools that streamline the development process.

## Features

- MVC architecture for organized code structure.
- Routing system for handling URL endpoints.
- View rendering with support for HTML templates.
- Flexible configuration and extensibility.

## Getting Started

Before you start using the Construct framework, make sure you have Dart installed on your machine. You can install Dart by following the instructions [here](https://dart.dev/get-dart).

To install the Construct framework, add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  construct: ^1.0.0  # Replace with the latest version
```

Run `dart pub get` to install the package.

## Usage

To create a new web application using the Construct framework, follow these steps:

1. Create a new Dart project:

```bash
dart create my_app
cd my_app
```

2. Add the Construct framework to your `pubspec.yaml`:

```yaml
dependencies:
  construct: ^1.0.0  # Replace with the latest version
```

3. Configure your application routes in `lib/app/config/routes.dart`:

```dart
import 'package:construct/core.dart';

import '../controllers/home.dart';

Router configureRoutes() {
  var router = Router();
  router.add('/', (_) => HomeController(HtmlView()).index(), HtmlView());
router.add('/json/:member',
      (params) => HomeController(JsonView()).jsonApiMember(params));
  // Add more routes as needed
  return router;
}
```
4. Create your controllers in the lib/app/controllers folder. For example, here's how you can define a controller to handle requests:
```dart
import 'package:construct/core.dart';

class HomeController extends Controller {
  HomeController(view) : super(view);
  @override
  String index() {
    return view.render('home/index.html'); // Render the index.html view
  }

  String sayHello(Map<String, dynamic> params) {
    return view.render('home/name.html',
        params: params); // Render the index.html view
  }

  String jsonApiMember(Map<String, dynamic> params) {
      // notice empty filename, just params, since we want json
    return view.render('',
        params: params); // Render the json view
  }
  // http://localhost:3000/json/Flak returns {"member":"Flak"} as content type html, 
  // but http://localhost:3000/json/Flak.json will return json
  
}


```
6.Create your views in the lib/app/views folder. Place your HTML templates in this folder. For example, here's how you can define an HTML template in lib/app/views/home/index.html:
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
</head>
<body>
    <h1>Welcome to our website!</h1>
</body>
</html>
```
6.1 Create name.html for /hello/Flak

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
</head>
<body>
    <h1>Hello, {{name}}!</h1>
</body>
</html>
```
Build other controllers and templates in the respective folders under `lib/app`.

 Run your application:

```bash
dart bin/construct.dart

```
or 

```
dart took/watcher.dart 

```
when in dev mode to restart server when file changes.

Visit `http://localhost:3000` in your browser to see your application in action.

## Additional Information

For more details and documentation about the Construct framework, we are working on them, open issue if you want to contribute. If you encounter any issues or have questions, feel free to open an issue on our [GitHub repository](https://github.com/base-al/construct).

We welcome contributions! 
Enjoy building with Construct!
