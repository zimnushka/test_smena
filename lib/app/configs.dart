import 'package:hive/hive.dart';
import 'package:test_smena/layers/storage/storage.dart';

part 'configs.g.dart';

@HiveType(typeId: AppStorage.configHiveId)
class AppConfig extends HiveObject {
  @HiveField(0)
  final bool isDebug;
  @HiveField(1)
  final String url;

  AppConfig({required this.isDebug, required this.url});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'isDebug': isDebug,
      'url': url,
    };
  }

  factory AppConfig.fromJson(Map<String, dynamic> map) {
    return AppConfig(
      isDebug: map['isDebug'] as bool,
      url: map['url'] as String,
    );
  }
}

final AppConfig defaultConfig = AppConfig(
  isDebug: true,
  url:
      'https://gist.githubusercontent.com/moisey312/10b304f7b00ffd17535604f4b38ebe6a/raw/eeb0334ccf8e33fb4be7495a395ddc2ec22f3a75/test.json',
);
