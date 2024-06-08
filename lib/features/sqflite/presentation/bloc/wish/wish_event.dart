part of 'wish_bloc.dart';

abstract class WishEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class LoadWishes extends WishEvent{}

class AddWish extends WishEvent{
  final Wish wish;
  AddWish(this.wish);
  @override

  List<Object?> get props => [wish];
}

class WishUpdateUi extends WishEvent{
  final Wish wish;

  WishUpdateUi(this.wish);

  @override

  List<Object?> get props => [wish];
}

class WishUpdate extends WishEvent{
   final Wish wish;
   WishUpdate(this.wish);
   @override
  List<Object?> get props => [wish];
}

class WishDelete extends WishEvent{
  final int id;
  WishDelete(this.id);

  @override

  List<Object?> get props => [id];
}