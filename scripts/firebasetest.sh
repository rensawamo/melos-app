#!bin/bash


if [ -d "android" ]; then
  pushd android

  # Flutter APKのビルド
  fvm flutter build apk  --dart-define=FLAVOR=dev 

  # Gradleタスクの実行
  ./gradlew app:assembleAndroidTest
  ./gradlew app:assembleDebug -Ptarget=integration_test/app_test.dart

  # 元のディレクトリに戻る
  popd
else
  echo "Error: Directory 'android' does not exist."
fi
