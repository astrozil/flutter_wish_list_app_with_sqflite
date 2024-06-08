import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/entities/wish.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/presentation/bloc/wish/wish_bloc.dart';

class WishWidget extends StatelessWidget {
  final Wish wish;
  const WishWidget({super.key, required this.wish});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(wish.title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                 const SizedBox(height:5,),
                  Text(wish.description),
                  Text(wish.isEditing.toString())
                ],
              ),
              const Expanded(child: SizedBox()),
              IconButton(onPressed: (){
                      context.read<WishBloc>().add(WishUpdateUi(wish));
              }, icon: const Icon(Icons.edit)),
              IconButton(onPressed: (){
                context.read<WishBloc>().add(WishDelete(wish.id!));
              }, icon: const Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
  }
}
