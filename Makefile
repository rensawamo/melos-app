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


#  local host web 
.PHONY: app-start-chrome
app-start-chrome:
	cd app/lib && fvm flutter run --dart-define=FLAVOR=dev -d chrome --web-browser-flag "--disable-web-security"
	   
#  you have to chage code  app/lib/core/data/remote_task_repo.dart localhost to your ip address ex) android emulator localhost -> 10.0.2.2
.PHONY: app-start-mydevice
app-start-mydevice:
	cd app/lib && fvm flutter run --dart-define=FLAVOR=dev
	   
