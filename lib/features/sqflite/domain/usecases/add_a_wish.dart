import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/repository/wish_repository.dart';

import '../entities/wish.dart';

class AddAWish{
  final WishRepository wishRepository;
  AddAWish(this.wishRepository);

  Future<void> call (Wish wish)async {
     await wishRepository.addWish(wish);
  }
}