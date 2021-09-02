import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:news_flutter/app/app.dart';
import 'package:news_flutter/data/data.dart';
import 'package:news_flutter/device/device.dart';
import 'package:news_flutter/domain/domain.dart';

/// The entry point of the application
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

/// Initialize the services before the app starts.
Future<void> initServices() async {
  Get.put(
    LocalUsecases(
      Get.put(
        Repository(
          Get.put(
            DeviceRepository(),
          ),
          Get.put(
            DataRepository(),
          ),
        ),
      ),
    ),
    permanent: true,
  );
  await DeviceRepository().init();
}

/// The my app class which will initialize the basic application structure.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    var localLang =
        Get.find<LocalUsecases>().getStringValue(DeviceConstants.localLang);

    return GetMaterialApp(
      title: StringConstants.appName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: Styles.lightTheme,
      darkTheme: Styles.darkTheme,
      fallbackLocale: const Locale(
        DataConstants.defaultLang,
      ),
      locale: Locale(
        localLang,
      ),
      translations: TranslationsFile(),
      getPages: AppPages.pages,
      initialRoute: AppPages.initial,
      enableLog: true,
    );
  }
}
