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

### JSON serialization
A point that I consider very annoying as far as HTTP clients goes is that, since flutter disables introspection for performance reasons, 
it can't automatically unmarshall json to an object type.

You'll have to provide a json-to-your-object function for each object type of your model. The implementation is trivial, but doing so for every class is pretty annoying.

There are code-generation library, that generates the implementation of the mapping (a bit like MapStruct in Java), you can find more information about it in the official documentation: https://docs.flutter.dev/development/data-and-backend/json#serializing-json-using-code-generation-libraries

For this project, I decided to use json-serializable. 

This means that all of my model class had to be annotated with ``@JsonSerializable``, then I run the build-runner with ``flutter pub run build_runner build``, and then I write the factory method ``fromJson``:

```dart
@JsonSerializable()
class SuccessfulOperation {
  String? code;
  String? message;

  SuccessfulOperation({
    this.code,
    this.message
  });

  factory SuccessfulOperation.fromJson(Map<String, dynamic> json) =>
      _$SuccessfulOperationFromJson(json);

}
```

## Time Library

In its core package, Dart only have two classes to manage time:
- Duration
- DateTime

If you need more than that, you'll have to install a library, but they don't seem to be used very widely...

I settled on time_machine.

The JSON Serialization doesn't understand these types, so you have to provide a custom converter to it:

```dart
class LocalDateConverter implements JsonConverter<LocalDate?, String?> {
  const LocalDateConverter();

  @override
  LocalDate? fromJson(String? json) => json == null ? null : LocalDatePattern.iso.parse(json).value;

  @override
  String? toJson(LocalDate? object) => object?.toString(LocalDatePattern.iso.patternText);
}
```

# State Management

An important part to understand with Flutter is the Declarative UI.

For example, in Flutter it’s okay to rebuild parts of your UI from scratch instead of modifying it. Flutter is fast enough to do that, even on every frame if needed.

Flutter is declarative. This means that Flutter builds its user interface to reflect the current state of your app. It can be summarized to:

``UI = f(STATE)``

To do that, Flutter differentiate two kind of states.

There are a ton of state management solutions on Flutter. Most of which are listed on [this documentation page.](https://docs.flutter.dev/development/data-and-backend/state-mgmt/options)

## Kind of states

### The Ephemeral State

This is basically something that is not worth serializing, like the current tab in a tabview or the state of a scrollview.

This can easily be handled using StatefulWidget (as opposed to StatelessWidget) when building a widget.

### The App State

This is generally what defines your app as a whole. 

The logged in user, the cart in a shopping app, the notifications in a social media, etc.

## Redux

While Redux is a popular solution amongst Web Developpers, it didn't the same attention by the Flutter users.

[The package available on pubspec](https://pub.dev/packages/flutter_redux) only having 400 likes.

## GetIt

GetIt is more popular than Redux, and offers multiple advantages:

- Extremely fast (O(1))
- Easy to learn/use
- Doesn't clutter your UI tree with special Widgets to access your data like provider or Redux does.

## Provider

Provider is one of the "Flutter Favorite" packages. 

While [the package](https://pub.dev/packages/provider) has more than 7K likes, and seem to be an appropriate solution,
the next one is even more interesting.

## GetX

As opposed to what the name might suggest, GetIt and GetX aren't related.

GetX isn't only a state management library, as it is more of a "does-it-all" lib.

The three pillars of GetX are:
- State management
- Route management
- Dependency management

[The package](https://pub.dev/packages/get) is very popular on pubspec with over 10K likes.

