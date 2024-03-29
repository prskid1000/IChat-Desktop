import 'package:IChat/layouts/account.dart';
import 'package:IChat/layouts/chat.dart';
import 'package:IChat/layouts/contacts.dart';
import 'package:IChat/layouts/home.dart';
import 'package:IChat/store/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(
    ChangeNotifierProvider(
      create: (context) => Store(),
      child: Consumer<Store>(builder: (context, store, child) {
        return MaterialApp(
          theme: store.theme.compareTo('dark') == 0
              ? ThemeData.dark().copyWith(
                  primaryColor: Colors.black,
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedItemColor: Colors.green,
                    unselectedItemColor: Colors.white,
                  ),
                )
              : ThemeData.light().copyWith(
                  primaryColor: Colors.white,
                  appBarTheme: AppBarTheme(backgroundColor: Colors.green),
                  snackBarTheme:
                      SnackBarThemeData(backgroundColor: Colors.green),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedItemColor: Colors.green,
                    unselectedItemColor: Colors.black,
                  ),
                ),
          initialRoute: 'Account',
          routes: {
            'Account': (context) => Account(),
            'Home': (context) => Home(),
            'Contact': (context) => Contacts(),
            'Chat': (context) => Chat(),
          },
          debugShowCheckedModeBanner: false,
        );
      }),
    ),
  );
}
