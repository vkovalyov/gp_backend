const _v1 = '/v1';

enum ApiVersion { v1 }

extension ApiVersiovExtension on ApiVersion {
  String getEndpoint() {
    switch (this) {
      case ApiVersion.v1:
        return _v1;
    }
  }
}
