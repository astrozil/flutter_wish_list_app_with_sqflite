import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/repository/wish_repository.dart';

import '../entities/wish.dart';

class GetAWish{
  final WishRepository wishRepository;
  GetAWish(this.wishRepository);

  Future<Wish> call(int id)async{
    return await wishRepository.getAWish(id);
  }
}