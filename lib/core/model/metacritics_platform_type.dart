const xboxOne = 'xbox-one';
const xboxSeriesX = 'xbox-series-x';
const pc = 'pc';

const playstation5 = 'playstation-5';
const playstation4 = 'playstation-4';

enum MetacriticPlatform {
  xboxOne,
  xboxSeriesX,
  pc,
  playstation4,
  playstation5,
}

extension MetacriticPlatformExtension on MetacriticPlatform {
  String getEndpoint() {
    switch (this) {
      case MetacriticPlatform.xboxOne:
        return xboxOne;
      case MetacriticPlatform.xboxSeriesX:
        return xboxSeriesX;
      case MetacriticPlatform.pc:
        return pc;
      case MetacriticPlatform.playstation4:
        return playstation4;
      case MetacriticPlatform.playstation5:
        return playstation5;
    }
  }
}
