#!bin/bash

.DEFAULT_GOAL := help

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?# .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":[^#]*? #| #"}; {printf "%-57s%s\n", $$1 $$3, $$2}'

# Bootstrap
.PHONY: bootstrap bs
bootstrap: 
	@./scripts/bootstrap.sh
bs: 
	@$(MAKE) bootstrap


#  cd app/lib && fvm flutter run --dart-define=FLAVOR=dev -d chrome --web-browser-flag "--disable-web-security"

#  local host web 
.PHONY: app-start-chrome
app-start-chrome:
	cd app/lib && fvm flutter run --dart-define=FLAVOR=dev -d emulator-5554
	
	   
#  you have to chage code  app/lib/core/data/remote_task_repo.dart localhost to your ip address ex) android emulator localhost -> 10.0.2.2
.PHONY: app-start-mydevice
app-start-mydevice:
	cd app/lib && fvm flutter run --dart-define=FLAVOR=dev
	   

.PHONY: test
test:
	cd app/lib && fvm flutter run -t integration_test/app_test.dart 

.PHONY: local-test-android
local-test-android:
	cd app/android && ./gradlew app:connectedAndroidTest -Ptarget=`pwd`/../integration_test/app_test.dart
  
	
.PHONY: build_apk
build_apk:
	chmod +x scripts/firebasetest.sh && \
	cd app && bash ../scripts/firebasetest.sh


.PHONY: instrumentation-test
instrumentation-test:
	cd app && gcloud firebase test android run --type instrumentation --app build/app/flutter-apk/app-debug.apk --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk --timeout 2m
