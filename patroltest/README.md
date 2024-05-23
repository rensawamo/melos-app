# [firebase test lab flutter integration test](https://docs.flutter.dev/testing/integration-tests)

## Flutter's Instrumentation Test vs. Robo Test

## Instrumentation Test

### Purpose
Instrumentation tests are designed to run on real devices or emulators to test the app's functionality.
Execution:
These tests require the app to be deployed and run on a device or emulator.
They provide a way to simulate user interactions with the app's UI and verify its behavior.

### Control
Developers write detailed test scripts specifying exactly what interactions to perform and what outcomes to expect.


### Use Cases
Used for end-to-end testing, UI testing, and functional testing.
Suitable for scenarios where specific user flows need to be tested.


### Complexity
Generally more complex and time-consuming to write and maintain.
Requires a good understanding of the app's UI and workflow.


## Robo Test
### Purpose
Robo tests are designed to automatically explore the app's UI and generate tests without the need for explicit test scripts.


### Execution
Robo tests are typically run on cloud-based test environments.
The testing framework navigates through the app, trying different UI elements and interactions.


### Control
Minimal control over specific interactions; the test framework decides which paths to take.
Useful for exploratory testing to uncover potential issues.


### Use Cases
Ideal for quick, automated testing without the need to write detailed test scripts.
Helps to find crashes, UI issues, and unexpected behaviors that might be missed in manual testing.

### Complexity
Easier to set up and execute compared to instrumentation tests.
Provides broad coverage with minimal effort but may miss specific edge cases.



### [Android set up](https://github.com/flutter/flutter/tree/main/packages/integration_test#android-device-testing)

Add firebase_options and google_service.json  and  setting gcloud
```sh
$ gcloud auth login

$ gcloud config set project PROJECT_ID

```


To run integration_test/foo_test.dart on a local Android device (emulated or physical):

```sh
$ ./gradlew app:connectedAndroidTest -Ptarget=`pwd`/../integration_test/integration_test.dart
```

create apk 
```sh
$ pushd android
flutter build apk
./gradlew app:assembleAndroidTest
./gradlew app:assembleDebug -Ptarget=<path_to_test>.dart
popd
```

Upload the build apks Firebase Test Lab, 
```sh
$ gcloud firebase test android run --type instrumentation   --app build/app/outputs/apk/debug/app-debug.apk   --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk   --timeout 2m

....
 OUTCOME │    TEST_AXIS_VALUE    │     TEST_DETAILS    │
├─────────┼───────────────────────┼─────────────────────┤
│ Passed  │ redfin-30-en-portrait │ 1 test cases passed │
```

