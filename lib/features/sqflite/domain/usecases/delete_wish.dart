import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/repository/wish_repository.dart';


class DeleteWish{
  final WishRepository wishRepository;
  DeleteWish(this.wishRepository);

  Future<void> call(int id) async{
     await wishRepository.deleteWish(id);
  }
}