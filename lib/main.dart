import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/data/datasources/local_datasource.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/data/repository_impl/wish_repository_impl.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/repository/wish_repository.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/usecases/add_a_wish.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/usecases/delete_wish.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/usecases/get_a_wish.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/usecases/get_wishes.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/usecases/update_wish.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/presentation/bloc/wish/wish_bloc.dart';

import 'package:flutter_wish_list_app_with_room/routing/router.dart';

void main() {
  final AppRouter appRouter = AppRouter();
  final LocalDataSource localDataSource = LocalDataSource.instance;
  final WishRepository wishRepository = WishRepositoryImpl(localDataSource);
  final GetWishes getWishes = GetWishes(wishRepository);
  final GetAWish getAWish = GetAWish(wishRepository);
  final UpdateWish updateWish = UpdateWish(wishRepository);
  final AddAWish addAWish = AddAWish(wishRepository);
  final DeleteWish deleteWish = DeleteWish(wishRepository);

  runApp(MainApp(
    appRouter: appRouter,
    getWishes: getWishes,
    getAWish: getAWish,
    updateWish: updateWish,
    addAWish: addAWish,
    deleteWish: deleteWish,
  ));
}

class MainApp extends StatelessWidget {
  final AppRouter appRouter;
  final GetWishes getWishes;
  final GetAWish getAWish;
  final UpdateWish updateWish;
  final AddAWish addAWish;
  final DeleteWish deleteWish;

  const MainApp(
      {super.key,
      required this.appRouter,
      required this.getWishes,
      required this.getAWish,
      required this.updateWish,
      required this.addAWish,
      required this.deleteWish});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishBloc(
          getWishes: getWishes,
          // getAWish: getAWish,
          updateWish: updateWish,
          addAWish: addAWish,
          deleteWish: deleteWish,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
