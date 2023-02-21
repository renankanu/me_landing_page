```makefile
.PHONY: f_release f_clear_pod 
FULL_VERSION := $(shell (cat pubspec.yaml | grep "version" | awk '{print $$2}'))
STRING_VERSION := $(shell (echo $(FULL_VERSION) | awk -F+ '{print $$1}'))
NUMBER_VERSION := $(shell (echo $(FULL_VERSION) | awk -F+ '{print $$2}'))



f_release: f_upgrade_version ## This is flutter release step.
	@echo "⊢ Running flutter release ⊣"
	@flutter "build" "apk" "--release"
	@open "build/app/outputs/flutter-apk"
	@echo "Done ✅"



f_clear_pod: ## This is clear podfile and install step.
	@echo "⊢ Running pod deintegrate and pod install in ios folder ⊣"
	@cd ios && pod deintegrate
	@cd ios && rm Podfile.lock
	@cd ios && pod install
	@echo "Done ✅"


f_upgrade_version: ## This is upgrade number version step.
	@echo "⊢ Running upgrade  number version ⊣"
	@$(eval NUMBER_VERSION := $(shell (echo $(NUMBER_VERSION) + 1 | bc)))
	@echo "New version: $(STRING_VERSION)+$(NUMBER_VERSION) ✓"
	@sed -i '' 's/^\(version: \).*$$/\1'${STRING_VERSION}+${NUMBER_VERSION}'/' pubspec.yaml
	@echo "Done ✅"



f_prod: f_upgrade_version ## This is flutter build appbundle step.
	@echo "⊢ Running flutter build appbundle ⊣"
	@flutter build appbundle
	@open "build/app/outputs/bundle/release"
	@echo "Done ✅"
```