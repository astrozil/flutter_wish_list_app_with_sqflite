import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/usecases/add_a_wish.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/usecases/delete_wish.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/usecases/get_wishes.dart';

import '../../../domain/entities/wish.dart';
import '../../../domain/usecases/update_wish.dart';

part 'wish_event.dart';
part 'wish_state.dart';

class WishBloc extends Bloc<WishEvent, WishState> {

  WishBloc(
  {required GetWishes getWishes,
  required AddAWish addAWish,
    required UpdateWish updateWish,
    required DeleteWish deleteWish
  }
      ) : _getWishes = getWishes,
  _addAWish = addAWish,
  _updateWish = updateWish,
  _deleteWish = deleteWish,
        super(WishInitial()) {


       on<LoadWishes>(_loadWishes);
       on<AddWish>(_addWish);
       on<WishUpdateUi>(_wishUpdateUi);
       on<WishUpdate>(_wishUpdate);
       on<WishDelete>(_wishDelete);

  }
final GetWishes _getWishes;
  final AddAWish _addAWish;
  final UpdateWish _updateWish;
  final DeleteWish _deleteWish;

  Future<void> _loadWishes(LoadWishes event,Emitter emit)async{
    emit(WishesLoading());
    try{
      final List<Wish> wishes = await _getWishes();
      emit(WishesLoaded(wishes));
    }catch(e){
      emit(WishesError(e.toString()));
    }
  }

  Future<void> _addWish(AddWish event, Emitter emit)async{
    emit(WishAdding());
    try{
      await _addAWish(event.wish);
      emit(WishAdded());
    }catch(e){
      emit(WishAddError(e.toString()));
    }
  }

  Future<void> _wishUpdateUi(WishUpdateUi event, Emitter emit)async{
    final List<Wish> wishes = await _getWishes();

    final updatingWish = event.wish.copyWith(isEditing: !event.wish.isEditing);

    final updatedWishes = wishes.map((w)
     {
       return w.id == event.wish.id ? updatingWish : w;
     }
    ).toList();

    emit(WishesLoaded(updatedWishes));

  }

  Future<void> _wishUpdate(WishUpdate event,Emitter emit)async{
    try{
      await _updateWish(event.wish);
      final wishes = await _getWishes();
      final updatedWishes = wishes.map((w){
        return w.id == event.wish.id? event.wish : w;
      }).toList();

      emit(WishesLoaded(updatedWishes));
    }catch(e){
      emit(WishesError(e.toString()));
    }
  }

  Future<void> _wishDelete(WishDelete event,Emitter emit)async{
    try{
      await _deleteWish(event.id);
      final List<Wish> wishes = await _getWishes();
      emit(WishesLoaded(wishes));
    }catch(e){
      emit(WishesError(e.toString()));
    }
  }

}

