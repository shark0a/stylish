import 'package:hive_flutter/hive_flutter.dart';
import 'package:stylish/Features/auth/data/models/user_response_model.dart';

class HiveAdapters {
  static void registerAll() {
    if (!Hive.isAdapterRegistered(5)) Hive.registerAdapter(UserModelAdapter());
    if (!Hive.isAdapterRegistered(6)) Hive.registerAdapter(HairAdapter());
    if (!Hive.isAdapterRegistered(7)) Hive.registerAdapter(AddressAdapter());
    if (!Hive.isAdapterRegistered(8)) {
      Hive.registerAdapter(CoordinatesAdapter());
    }
    if (!Hive.isAdapterRegistered(9)) Hive.registerAdapter(BankAdapter());
    if (!Hive.isAdapterRegistered(10)) Hive.registerAdapter(CompanyAdapter());
    if (!Hive.isAdapterRegistered(11)) Hive.registerAdapter(CryptoAdapter());
  }
}
