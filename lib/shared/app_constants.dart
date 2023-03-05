import 'package:flutter/painting.dart';

abstract class AppConstants {
  static const String makeFileConf = r'''
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
	@cd ios && pod deintegrate && rm Podfile.lock && pod install
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
''';

  static const String vsCodeConf = r'''
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
''';

  static const String extensionVsCode = r'''
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

  static const String gitConfig = r'''
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

  static const String zshConfig = r'''
```bash
# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/Users/renankanu/development/flutter/bin"
export PATH="$PATH":"/Users/renankanu/development/flutter/.pub-cache/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

# React Native
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

plugins=(git)

source $ZSH/oh-my-zsh.sh

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_USER_COLOR="#6A76FB"


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
```
''';

  static Path pathGit() {
    const size = 24;
    Path path = Path();
    path.moveTo(size * 0.1083333, size * 0.4412500);
    path.lineTo(size * 0.3491667, size * 0.2000000);
    path.lineTo(size * 0.4195833, size * 0.2708333);
    path.arcToPoint(const Offset(size * 0.4583333, size * 0.3637500),
        radius: const Radius.elliptical(size * 0.08333333, size * 0.08333333),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path.lineTo(size * 0.4583333, size * 0.5945833);
    path.arcToPoint(const Offset(size * 0.4166667, size * 0.6666667),
        radius: const Radius.elliptical(size * 0.08333333, size * 0.08333333),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path.arcToPoint(const Offset(size * 0.5833333, size * 0.6666667),
        radius: const Radius.elliptical(size * 0.08333333, size * 0.08333333),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path.arcToPoint(const Offset(size * 0.5416667, size * 0.5945833),
        radius: const Radius.elliptical(size * 0.08333333, size * 0.08333333),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path.lineTo(size * 0.5416667, size * 0.3920833);
    path.lineTo(size * 0.6279167, size * 0.4791667);
    path.arcToPoint(const Offset(size * 0.6250000, size * 0.5000000),
        radius: const Radius.elliptical(size * 0.04875000, size * 0.04875000),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path.arcToPoint(const Offset(size * 0.7083333, size * 0.4166667),
        radius: const Radius.elliptical(size * 0.08333333, size * 0.08333333),
        rotation: 0,
        largeArc: true,
        clockwise: false);
    path.arcToPoint(const Offset(size * 0.6875000, size * 0.4195833),
        radius: const Radius.elliptical(size * 0.04875000, size * 0.04875000),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path.lineTo(size * 0.5804167, size * 0.3125000);
    path.arcToPoint(const Offset(size * 0.5325000, size * 0.2150000),
        radius: const Radius.elliptical(size * 0.08333333, size * 0.08333333),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path.arcToPoint(const Offset(size * 0.4791667, size * 0.2112500),
        radius: const Radius.elliptical(size * 0.08750000, size * 0.08750000),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path.lineTo(size * 0.4083333, size * 0.1408333);
    path.lineTo(size * 0.4412500, size * 0.1083333);
    path.arcToPoint(const Offset(size * 0.5587500, size * 0.1083333),
        radius: const Radius.elliptical(size * 0.08333333, size * 0.08333333),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.lineTo(size * 0.8920833, size * 0.4416667);
    path.arcToPoint(const Offset(size * 0.8920833, size * 0.5591667),
        radius: const Radius.elliptical(size * 0.08333333, size * 0.08333333),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.lineTo(size * 0.5587500, size * 0.8925000);
    path.arcToPoint(const Offset(size * 0.4412500, size * 0.8925000),
        radius: const Radius.elliptical(size * 0.08333333, size * 0.08333333),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.lineTo(size * 0.1079167, size * 0.5591667);
    path.arcToPoint(const Offset(size * 0.1083333, size * 0.4412500),
        radius: const Radius.elliptical(size * 0.08333333, size * 0.08333333),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.close();
    return path;
  }

  static Path pathFlutter() {
    const size = 24;
    Path path_0 = Path();
    path_0.moveTo(size * 0.5909062, size * 0.4637500);
    path_0.lineTo(size * 0.3382187, size * 0.7159375);
    path_0.lineTo(size * 0.5908750, size * 0.9685938);
    path_0.lineTo(size * 0.8788125, size * 0.9685938);
    path_0.lineTo(size * 0.6265312, size * 0.7160000);
    path_0.lineTo(size * 0.8788125, size * 0.4637187);
    path_0.lineTo(size * 0.5909375, size * 0.4637187);
    path_0.close();
    path_0.moveTo(size * 0.5903750, size * 0.03137500);
    path_0.lineTo(size * 0.1212187, size * 0.5000000);
    path_0.lineTo(size * 0.2657188, size * 0.6445000);
    path_0.lineTo(size * 0.8781875, size * 0.03190625);
    path_0.lineTo(size * 0.5908750, size * 0.03190625);
    path_0.close();
    return path_0;
  }

  static Path pathDart() {
    const size = 24;
    Path path = Path();
    path.moveTo(size * 0.6887188, size * 0.1921563);
    path.cubicTo(size * 0.6536563, size * 0.1572187, size * 0.6181563,
        size * 0.1227500, size * 0.5818750, size * 0.08909375);
    path.cubicTo(size * 0.5716562, size * 0.07800000, size * 0.5570625,
        size * 0.07106250, size * 0.5408438, size * 0.07106250);
    path.cubicTo(size * 0.5405938, size * 0.07106250, size * 0.5403750,
        size * 0.07106250, size * 0.5401250, size * 0.07106250);
    path.lineTo(size * 0.5401563, size * 0.07106250);
    path.cubicTo(size * 0.5276250, size * 0.07228125, size * 0.5161250,
        size * 0.07496875, size * 0.5052500, size * 0.07896875);
    path.lineTo(size * 0.5062188, size * 0.07865625);
    path.lineTo(size * 0.2793438, size * 0.1920938);
    path.close();
    path.moveTo(size * 0.2185938, size * 0.2185938);
    path.lineTo(size * 0.2185938, size * 0.6782500);
    path.cubicTo(size * 0.2182813, size * 0.6808437, size * 0.2180938,
        size * 0.6838437, size * 0.2180938, size * 0.6868750);
    path.cubicTo(size * 0.2180938, size * 0.7063125, size * 0.2256875,
        size * 0.7240000, size * 0.2380625, size * 0.7370937);
    path.lineTo(size * 0.2380312, size * 0.7370625);
    path.lineTo(size * 0.4299688, size * 0.9289687);
    path.lineTo(size * 0.7627500, size * 0.9289687);
    path.lineTo(size * 0.7627500, size * 0.7627187);
    path.close();
    path.moveTo(size * 0.1921250, size * 0.1920938);
    path.cubicTo(size * 0.1921250, size * 0.1920938, size * 0.3891875,
        size * 0.09362500, size * 0.4876875, size * 0.04434375);
    path.cubicTo(size * 0.5031875, size * 0.03653125, size * 0.5214375,
        size * 0.03196875, size * 0.5407812, size * 0.03196875);
    path.cubicTo(size * 0.5424062, size * 0.03196875, size * 0.5440625,
        size * 0.03200000, size * 0.5456875, size * 0.03206250);
    path.lineTo(size * 0.5454687, size * 0.03206250);
    path.cubicTo(size * 0.5706562, size * 0.03703125, size * 0.5927500,
        size * 0.04781250, size * 0.6111250, size * 0.06300000);
    path.lineTo(size * 0.6108750, size * 0.06281250);
    path.lineTo(size * 0.9680312, size * 0.4200000);
    path.lineTo(size * 0.9680312, size * 0.8017500);
    path.lineTo(size * 0.8017812, size * 0.8017500);
    path.lineTo(size * 0.8017812, size * 0.9680000);
    path.lineTo(size * 0.4138437, size * 0.9680000);
    path.lineTo(size * 0.06287500, size * 0.6170312);
    path.cubicTo(size * 0.04428125, size * 0.5979062, size * 0.03262500,
        size * 0.5719375, size * 0.03209375, size * 0.5432187);
    path.lineTo(size * 0.03209375, size * 0.5431250);
    path.cubicTo(size * 0.03368750, size * 0.5271562, size * 0.03806250,
        size * 0.5125625, size * 0.04475000, size * 0.4993125);
    path.lineTo(size * 0.04443750, size * 0.5000312);
    path.close();
    return path;
  }
}
