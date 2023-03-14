import 'package:gp_backend/feature/api/v1/domain/model/xbox_platformDependencies_model.dart';

class Packages {
  List<PlatformDependencies>? platformDependencies;
  Set<String>? platforms;

  Packages({
    this.platformDependencies,
    this.platforms,
  });

  Packages.fromJson(Map<String, dynamic> json) {
    if (json['PlatformDependencies'] != null) {
      platformDependencies = <PlatformDependencies>[];
      json['PlatformDependencies'].forEach((v) {
        platformDependencies!.add(PlatformDependencies.fromJson(v));
      });
    }

    platforms = {};

    platformDependencies?.forEach((element) {
      platforms?.add(element.platformName ?? '');
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (platformDependencies != null) {
      data['PlatformDependencies'] =
          platformDependencies!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
