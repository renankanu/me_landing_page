.PHONY: help f_clean pubspec_delete f_release f_clear_pod f_pub_runner
FULL_VERSION := $(shell (cat pubspec.yaml | grep "version" | awk '{print $$2}'))
STRING_VERSION := $(shell (echo $(FULL_VERSION) | awk -F+ '{print $$1}'))
NUMBER_VERSION := $(shell (echo $(FULL_VERSION) | awk -F+ '{print $$2}'))

help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
	done

f_clean: ## This is clean step.
	@echo "⊢ Running flutter clean ⊣"
	@flutter clean
	@echo "Done ✅"

pubspec_delete: f_clean ## This is delete pubspec.lock step.
	@echo "⊢ Deleting pubspec.lock ⊣"
	@rm pubspec.lock
	@echo "Done ✅"

f_pub_get: pubspec_delete ## This is flutter pub get step.
	@echo "⊢ Running flutter pub get ⊣"
	@flutter pub get
	@echo "Done ✅"

f_pub_runner: f_pub_get ## This is flutter pub run build_runner step.
	@echo "⊢ Running flutter pub run build_runner ⊣"
	@flutter pub run build_runner build --delete-conflicting-outputs
	@echo "Done ✅"

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

