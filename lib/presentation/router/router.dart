import 'package:flutter/material.dart';
import 'package:giesse_app/presentation/Screens/customersScreen.dart';
import 'package:giesse_app/presentation/Screens/dbSelectionScreen.dart';
import 'package:giesse_app/presentation/Screens/downloadingDataScreen.dart';
import 'package:giesse_app/presentation/Screens/insertOrderScreen.dart';
import 'package:giesse_app/presentation/Screens/productsScreen.dart';
import 'package:giesse_app/presentation/Screens/signInScreen.dart';
import 'package:giesse_app/presentation/Screens/userScreen.dart';

// Navigator.of(context).pushReplacementNamed('/DownloadingDataScreen'),
class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/SignIn':
        return MaterialPageRoute(
          builder: (_) => SignInScreen(),
        );
      case '/DatabaseSelection':
        return MaterialPageRoute(
          builder: (_) => DatabaseSelection(),
        );
      case '/DownloadingDataScreen':
        return MaterialPageRoute(
          builder: (_) => DownloadingDataScreen(),
        );
      case '/CustomersScreen':
        return MaterialPageRoute(
          builder: (_) => CustomersScreen(),
        );
      case '/InsertOrderScreen':
        return MaterialPageRoute(
          builder: (_) => InsertOrderScreen(),
        );
      case '/ProductsScreen':
        return MaterialPageRoute(
          builder: (_) => ProductsScreen(),
        );
      case '/UserScreen':
        return MaterialPageRoute(
          builder: (_) => UserScreen(),
        );
      default:
        return null;
    }
  }
}