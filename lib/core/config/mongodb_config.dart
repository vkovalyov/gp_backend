import 'package:dotenv/dotenv.dart';

class MongodbConfig {
  late final String connectionString;

  MongodbConfig() {
    connectionString = env['MONGO_CONNECTION_STRING'] ?? '';
  }
}
