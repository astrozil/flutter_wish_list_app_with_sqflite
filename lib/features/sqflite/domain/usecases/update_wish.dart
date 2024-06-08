import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/repository/wish_repository.dart';

import '../entities/wish.dart';

class UpdateWish{
  final WishRepository wishRepository;
  UpdateWish(this.wishRepository);

  Future<void> call(Wish wish)async{
    await wishRepository.updateWish(wish);
  }
}