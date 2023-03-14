const _baseEndpoint = '/';
const _apiEndpoint = '/api';
const _publicEndpoint = '/public';

enum AppEndpoint { base, api, public }

extension AppEndpointExtension on AppEndpoint {
  String getEndpoint() {
    switch (this) {
      case AppEndpoint.base:
        return _baseEndpoint;
      case AppEndpoint.api:
        return _apiEndpoint;
      case AppEndpoint.public:
        return _publicEndpoint;
    }
  }
}
