import 'dart:convert';

import 'package:flutter/services.dart';

abstract class Config {
  static Map<String, dynamic> _config;

  static Future<void> initialize() async {
    final configString = await rootBundle.loadString('config/app_config.json');
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String getWiredashProjectId() =>
      _config['wiredash_project_id'] as String ?? '';
  static String getWiredashApiKey() =>
      _config['wiredash_api_secret'] as String ?? '';
}
