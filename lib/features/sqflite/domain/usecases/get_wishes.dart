import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/entities/wish.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/repository/wish_repository.dart';



class GetWishes{
  final WishRepository wishRepository;

  GetWishes(this.wishRepository);

  Future<List<Wish>> call()async{
   return await wishRepository.getWishes();
  }
}