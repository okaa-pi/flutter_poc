# vidis

Vidis Flutter version

# Usage of scripts

To use pubspec scripts, you need to activate rps:

```bash
dart pub global activate rps
```

Then you can run multiple scripts defined in pubspec.yaml:

```bash
rps run dev
```

```
rps build
```

# Upgrade to Flutter 3

The upgrade to Flutter 3 was not as easy as it looked like.

While the effective upgrade was performed with a simple ```flutter upgrade```, the app was not working anymore on iOS.
I looked for a solution for weeks, and Flutter finally released version 3.0.4 that fixed the issue.

The other solution would have been to rollback to Flutter 2. 


# Observations

## Design

Choosing between Material or iOS design is a definite decision.

You specifically have to use different components depending on the design you choose, only a small amount of them being shared.

You can put the different elements in `if/else` logic, but this ends up in rather verbose elements.

My suggestion would be then to split the `presentation` layer into iOS and Material designs, and to only share the common library (REST calls, state mgmt).

And directly splitting it at the root, in `main.dart`:

```dart
class VidisApp extends StatelessWidget {
  const VidisApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS) {
      return const CupertinoApp(...);
    }
    else {
      return MaterialApp(...);
    }
  }
}
```

## Backend integration

To integrate a REST API, I initially wanted to generate code from the openapi specification.

There is a variant of the openapi-generator for Dart: https://github.com/gibahjoe/openapi-generator-dart

The issue is that this generator doesn't accept a lot of parameters; and the one needed in the case of VIDIS is not supported (skipFormModel=false).

Another issue is also that this library generates a lot of boilerplate that is not useful for us.

The decision was to switch to a manual implementation.

There are multiple choices to choose from when implementing HTTP calls; one of which is the use of the flutter-provided `http` library.

A popular choice seems to be [`dio`](https://pub.dev/packages/dio), which supports Interceptors, FormData, Request Cancellation, File Downloading, Timeout etc. (those can be tricky to implement manually with `http`)

Another popular choice is also [`chopper`](https://pub.dev/packages/chopper), 

While they both seem interesting, `dio` is far more popular, so we'll stick with this one.

A point that I consider very annoying as far as HTTP clients goes is that, since flutter disables introspection for performance reasons, 
it can't automatically unmarshall json to an object type.

You'll have to provide a json-to-your-object function for each object type of your model. The implementation is trivial, but doing so for every class is pretty annoying.



## GetX

GetX seems to be a widely used general helpful tool when working with Flutter

https://pub.dev/packages/get

It helps handle localization, theme, state management, routing, and dependency management.

## Time Library

In its core package, Dart only have two classes to manage time:
- Duration
- DateTime

If you need more than that, you'll have to install a library, but they don't seem to be used very widely...

I settled on time_machine.

