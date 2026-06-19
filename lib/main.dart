import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_chat/features/otp/presentation/provider/otp_provider.dart';

import 'core/utils/local_data_store.dart';
import 'di/locator.dart';
import 'features/login/presentation/provider/login_provider.dart';
import 'features/splash/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HiveService.instance.init();
  setLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => locator<LoginProvider>()),
        ChangeNotifierProvider(create: (context) => locator<OtpProvider>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: SplashScreen(),
      ),
    );
  }
}
