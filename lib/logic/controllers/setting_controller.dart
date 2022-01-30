import 'package:e_commerce_app/utils/my_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  var switchValue = false.obs;
  GetStorage storage = GetStorage();
  var langLocal = ene;

  // method to make first char of name capital
  String capitalize(String profileName) {
    return profileName.split(" ").map((name) => name.capitalize).join(" ");
  }

  // language logic

  void onInit() async {
    super.onInit();
    langLocal = await getLanguage;
  }

  Future<void> saveLanguage(String lang) async {
    await storage.write('lang', lang);
  }

  Future<String> get getLanguage async {
    return await storage.read('lang');
  }

  void changeLanguage(String languageCode) {
    saveLanguage(languageCode);
    if (langLocal == languageCode) {
      return;
    }
    if (languageCode == frf) {
      langLocal = frf;
      saveLanguage(frf);
    } else if (languageCode == ara) {
      langLocal = ara;
      saveLanguage(ara);
    } else {
      langLocal = ene;
      saveLanguage(ene);
    }
    update();
  }
}
