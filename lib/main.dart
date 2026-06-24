import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_chat/features/home/presentation/screens/Homescreen.dart';
import 'package:sample_chat/features/otp/presentation/provider/otp_provider.dart';
import 'package:sample_chat/features/single_chat/presentation/provider/user_chat_list_provider.dart';

import 'core/utils/local_data_store.dart';
import 'di/locator.dart';
import 'features/home/presentation/provider/user_list_provider.dart';
import 'features/login/presentation/provider/login_provider.dart';

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
        ChangeNotifierProvider(
          create: (context) => locator<UserListProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => locator<UserChatListProvider>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: HomeScreen(email: 'samir@test.com'),
      ),
    );
  }
}
