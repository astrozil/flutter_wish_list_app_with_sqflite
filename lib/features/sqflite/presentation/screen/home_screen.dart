import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/entities/wish.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/presentation/widgets/wish_updating_widget.dart';

import 'package:flutter_wish_list_app_with_room/features/sqflite/presentation/widgets/wish_widget.dart';
import 'package:flutter_wish_list_app_with_room/routing/routes.dart';

import '../bloc/wish/wish_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: const Text("Wish List"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: ()async {
         var result = await Navigator.pushNamed(context, Routes.addUpdateScreen,arguments: 0);
         if(result == "Success"){
           if(context.mounted){
             context.read<WishBloc>().add(LoadWishes());
           }
         }
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: BlocBuilder<WishBloc, WishState>(
        builder: (context, state) {
          if (state is WishInitial) {

            context.read<WishBloc>().add(LoadWishes());
          } else if (state is WishesLoading) {

          } else if (state is WishesLoaded) {

            final List<Wish> wishes = state.wishes;
            return ListView.builder(
                itemCount: wishes.length,
                itemBuilder: (context, index) {
                  final Wish wish = wishes[index];
                   if(wish.isEditing == false){
                     return WishWidget(wish: wish);
                   }else{
                      return WishUpdatingWidget(wish: wish);
                   }

                });
          } else if (state is WishesError) {

            return Text(state.message);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
