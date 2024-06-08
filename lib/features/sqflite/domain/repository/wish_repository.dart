import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/entities/wish.dart';

abstract class WishRepository{
  Future<List<Wish>> getWishes();
  Future<Wish> getAWish(int id);
  Future<void> addWish(Wish wish);
  Future<void> updateWish(Wish wish);
  Future<void> deleteWish(int id);
}