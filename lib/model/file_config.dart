import 'package:me_landing_page/model/type_file.dart';
import 'package:me_landing_page/shared/app_constants.dart';

import '../shared/app_images.dart';

class FileConfig {
  final String icon;
  final String name;
  final TypeFile typeFile;
  final String fileContent;
  bool isExpanded;

  FileConfig({
    required this.icon,
    required this.name,
    required this.typeFile,
    required this.fileContent,
    this.isExpanded = false,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FileConfig &&
        other.typeFile == typeFile &&
        other.fileContent == fileContent;
  }

  @override
  int get hashCode => typeFile.hashCode ^ fileContent.hashCode;

  static List<FileConfig> get files => [
        FileConfig(
          icon: AppImages.makefile,
          name: 'Makefile',
          typeFile: TypeFile.makefile,
          fileContent: AppConstants.makeFileConf,
        ),
        FileConfig(
          icon: AppImages.json,
          name: 'settings.json',
          typeFile: TypeFile.json,
          fileContent: AppConstants.vsCodeConf,
        ),
        FileConfig(
          icon: AppImages.console,
          name: '.zshrc',
          typeFile: TypeFile.shell,
          fileContent: AppConstants.zshConfig,
        ),
        FileConfig(
          icon: AppImages.git,
          name: '.gitconfig',
          typeFile: TypeFile.shell,
          fileContent: AppConstants.gitConfig,
        ),
      ];
}
