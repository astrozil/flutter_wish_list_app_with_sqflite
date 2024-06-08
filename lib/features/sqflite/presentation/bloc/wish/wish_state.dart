part of 'wish_bloc.dart';

sealed class WishState extends Equatable {
  @override
  List<Object> get props => [];
}

final class WishInitial extends WishState {

}

final class WishesLoading extends WishState{}

final class WishesLoaded extends WishState{
  final List<Wish> wishes;
  WishesLoaded(this.wishes);

  @override
  List<Object> get props => [wishes];
}

final class WishesError extends WishState{
  final String message;
  WishesError(this.message);

  @override

  List<Object> get props => [message];
}

final class WishAdding extends WishState{}

final class WishAdded extends WishState{}

final class WishAddError extends WishState{
  final String message;
  WishAddError(this.message);

  @override

  List<Object> get props => [message];
}