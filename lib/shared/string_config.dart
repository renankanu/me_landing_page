String get makeFileConf => r'''
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
''';

String get vsCodeConf => r'''
```json
{
  "workbench.iconTheme" : "material-icon-theme",
  "[dart]" : {
    "editor.formatOnSave": true,
    "editor.formatOnType": true,
    "editor.rulers": [
      80,
      120
    ],
    "editor.selectionHighlight": false,
    "editor.suggest.snippetsPreventQuickSuggestions": false,
    "editor.suggestSelection": "first",
    "editor.tabCompletion": "onlySnippets",
    "editor.wordBasedSuggestions": false
  },
  "dart.analysisExcludedFolders": [
    "./__brick__"
  ],
  "editor.unicodeHighlight.ambiguousCharacters" : false,
  "explorer.confirmDelete" : false,
  "search.exclude" : {
    "**\/.fvm" : true
  },
  "sync.gist" : "6f4d06803e16a1b49cf317965f0fc900",
  "editor.accessibilitySupport" : "off",
  "editor.fontLigatures" : true,
  "debug.openDebug" : "openOnDebugBreak",
  "editor.codeActionsOnSave" : {
    "source.organizeImports" : true,
    "source.fixAll" : true
  },
  "explorer.compactFolders" : false,
  "cSpell.ignorePaths" : [
    "pubspec.yaml",
    "pubspec.lock"
  ],
  "dart.debugSdkLibraries" : true,
  "editor.fontSize" : 14,
  "cSpell.userWords" : [
      // some words
  ],
  "cSpell.language" : "pt,en",
  "workbench.colorTheme" : "Tokyo Night",
  "security.workspace.trust.untrustedFiles" : "open",
  "dart.debugExternalPackageLibraries" : true,
  "redhat.telemetry.enabled" : true,
  "files.watcherExclude" : {
    "**\/.fvm" : true
  },
  "explorer.confirmDragAndDrop" : false,
  "files.exclude" : {
    "**\/*.g.dart" : true
},
  "editor.inlineSuggest.enabled" : true,
  "editor.fontFamily" : "JetBrains Mono",
  "terminal.integrated.env.osx" : {
    "FIG_NEW_SESSION": "1"
  },
  "editor.minimap.renderCharacters" : false,
  "tabnine.experimentalAutoImports" : true,
  "editor.minimap.size": "fit",
  "workbench.startupEditor": "none",
  "[jsonc]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[typescriptreact]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode",
    "editor.formatOnSave": true,
    "editor.codeActionsOnSave": {
      "source.fixAll.eslint": true
    }
  },
  "git.enableSmartCommit": true,
  "git.confirmSync": false,
  "diffEditor.ignoreTrimWhitespace": false
}
```
''';

String get extensionVsCode => r'''
### Dart
O Dart Code adiciona suporte ao [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code) no Visual Studio Code.

---
### Flutter
Essa extensão adiciona suporte ao [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) no Visual Studio Code.

---
### Awesome Flutter Snippets
Esta [extensão](https://marketplace.visualstudio.com/items?itemName=Nash.awesome-flutter-snippets) adiciona vários snippets para o Flutter, incluindo widgets, construtores, métodos e muito mais.

---
### GitLens — Git supercharged
[GitLens supercharged](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens) o Git dentro do Visual Studio Code. Ele ajuda você a explorar e entender o código. Ele fornece informações valiosas sobre o código, como quem foi o último a modificá-lo, quando e por que.

---
### Tokyo Night
O [Tokyo Night](https://marketplace.visualstudio.com/items?itemName=enkia.tokyo-night) é um tema de cores escuras para o Visual Studio Code.

---
### YAML
O [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml) adiciona suporte ao YAML no Visual Studio Code.

---
### Bloc
A extensão [bloc](https://marketplace.visualstudio.com/items?itemName=FelixAngelov.bloc) adiciona suporte ao [Bloc Library](https://pub.dev/packages/bloc) no Visual Studio Code. Facilita a criação de blocs, cubits e bloc observers.

---
### Name That Color
A extensão [Name That Color](https://marketplace.visualstudio.com/items?itemName=guillaumedoutriaux.name-that-color) converte a representação de cores hexadecimais ou rgb em nomes amigáveis.

---
###Dart Data Class Generator
A extensão [Dart Data Class Generator](https://marketplace.visualstudio.com/items?itemName=dotup.dotup-dart-data-class-generator) pode gerar os métodos construtor, copyWith, toMap, fromMap, toJson, fromJson, toString, operator == e hashCode para uma classe baseada em propriedades de classe ou JSON bruto.

---
### GitHub Pull Requests and Issues
A extensão [GitHub Pull Requests and Issues](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github) permite que você visualize e gerencie seus pull requests e problemas diretamente no Visual Studio Code.

---
### Dev Containers
A extensão [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) permite que você use um contêiner como seu ambiente de desenvolvimento.
''';

String get gitConfig => r'''
```bash
[core]
	editor = code --wait
[user]
	name = seu user
	email = seu email
[alias]
	c = !git add --all && git commit -m
	s = !git status -s
	l = !git log --pretty=format:'%C(blue)%h%C(red)%d %C(white)%s - %C(cyan)%cn, %C(green)%cr'
	t = "!f() { git tag -am $1 $1; }; f"
	amend = !git add --all && git commit --amend --no-edit
	save = !git add --all && git commit -m 'SAVEPOINT'
	wip = !git add --all && git commit -m "WIP"
[push]
	followTags = true
[merge "ours"]
	driver = true
```
''';
