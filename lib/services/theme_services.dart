import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeServices {
  final storage = GetStorage();
  final _key = 'isDarkMode';

  _saveThemetoStorage(bool isDarkMode) {
    storage.write(_key, isDarkMode);
  }

  _loadThemefromStorage() {
    return storage.read<bool>(_key) ?? false;
  }

  void switchTheme() {
    Get.changeThemeMode(_loadThemefromStorage() ? ThemeMode.light:ThemeMode.dark);
    _saveThemetoStorage(!_loadThemefromStorage());
  }

 ThemeMode get theme =>
    _loadThemefromStorage() ? ThemeMode.dark : ThemeMode.light;

}
