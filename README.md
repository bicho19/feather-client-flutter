# Flutter Feather Client Plugin

A Flutter plugin to use the [Feather API](https://feather.id/).

*Note*: This plugin is still under development, and some APIs might not be available yet. [Feedback](https://github.com/bicho19/feather-client-flutter/issues) and [Pull Requests](https://github.com/bicho19/feather-client-flutter/pulls) are most welcome!


Have any questions? Join [Feather Discord](https://discord.gg/S55amqV) 👋


## Available Features

|      Feature                                              | Status  |
|:---------------------------------------------------------:|:-------:|
| Create a credential [(Email and password)]()      |    ✅   |
| Create a credential (Email verification - passwordless -)      |    ⚙️   |
| [Update a credential](https://feather.id/docs/undefined#updateCredential)     |    ⚙️   |
| [Update a credential password](https://feather.id/docs/undefined#updateCredentialPassword)     |    ⚙️   |
| [Creates a user](https://feather.id/docs/undefined#createUser)     |    ✅   |
| [Retrieve a user](https://feather.id/docs/undefined#retrieveUser)     |    ⚙️   |
| [Update a user](https://feather.id/docs/undefined#updateUser)     |    ⚙️   |
| [Update a user's email](https://feather.id/docs/undefined#updateUserEmail)     |    ⚙️   |
| [Refresh a user's tokens](https://feather.id/docs/undefined#refreshUserTokens)     |    ⚙️   |
| [Revoke a user's tokens](https://feather.id/docs/undefined#revokeUserTokens) |    ⚙️  |

* ✅ Done
* ⚙️ Under development


## Getting Started
```yml
dependencies:
  ...
  feather_client_flutter: 
```

## Usage example

The Feather plugin must be initialized with your project's API key, available on the [Feather Dashboard](https://feather.id/dashboard).

Add the following imports to your Dart code:
```dart
import 'package:feather_client_flutter/feather_client_flutter.dart';
```
Initialize `FeatherClient` :
```dart
FeatherClient featherClient = FeatherClient(apiKey: "YOUR_API_KEY");
```
To sign in:

```dart
featherClient
        .newCurrentCredential(email: "test5@test.com", password: "password")
        .then((credential) {
          if (credential.status == "valid") {
            featherClient.newCurrentUser(token: credential.token).then((featherUser) {
              print("User id : ${featherUser.id}");
            }).catchError((error) {
              // Handle errors
              print(error.toString());
            }
          } 
        );
        }).catchError((error) {
          // Handle errors
          print(error.toString());
    });
```

## Error handling

If a method fails it will throw a `FeatherException` with the error code as a string.
So make sure to wrap your calls with a `try..catch` or add a `.catchError` functions.
Check the source comments to see which error codes each method could throw.

## Supported authentication methods

* Email and Password
* Anonymously (To be added later)