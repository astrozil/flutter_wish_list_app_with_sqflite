import 'package:flutter_wish_list_app_with_room/features/sqflite/data/datasources/local_datasource.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/data/model/wish_model.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/entities/wish.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/repository/wish_repository.dart';


class WishRepositoryImpl extends WishRepository{

  final LocalDataSource localDataSource;

  WishRepositoryImpl(this.localDataSource);
  @override
  Future<void> addWish(Wish wish) async {
    await localDataSource.insert(WishModel(id: wish.id, title: wish.title, description: wish.description));
  }

  @override
  Future<void> deleteWish(int id)async {
   await localDataSource.delete(id);
  }

  @override
  Future<List<Wish>> getWishes()async {
   return await localDataSource.getAllWishes();
  }

  @override
  Future<void> updateWish(Wish wish)async {
   await localDataSource.update(WishModel(id: wish.id, title: wish.title, description: wish.description));
  }

  @override
  Future<Wish> getAWish(int id)async {
    final WishModel?  wishModel = await localDataSource.getAWish(id);
     return   Wish(id: wishModel!.id, title: wishModel.title, description: wishModel.description);
  }

}