

import 'package:flutter/material.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/presentation/screen/add_update_screen.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/presentation/screen/home_screen.dart';
import 'package:flutter_wish_list_app_with_room/routing/routes.dart';

class AppRouter{
  Route? onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case  Routes.homeScreen:
        return MaterialPageRoute(builder: (_)=> const HomeScreen());

      case Routes.addUpdateScreen:
        final args = routeSettings.arguments as int;
        return MaterialPageRoute(builder: (_)=>  AddUpdateScreen(id: args));

      default:
        return null;
    }
  }
}