const _gamePassGames = '/game-pass';
const _gamePassGamesById = '/game-pass/<id>';

enum GamePassEndpoint {
  gamePass,
  gamePassGamesById,
}

extension GamePassEndpointExtension on GamePassEndpoint {
  String getEndpoint() {
    switch (this) {
      case GamePassEndpoint.gamePass:
        return _gamePassGames;
      case GamePassEndpoint.gamePassGamesById:
        return _gamePassGamesById;
    }
  }
}
