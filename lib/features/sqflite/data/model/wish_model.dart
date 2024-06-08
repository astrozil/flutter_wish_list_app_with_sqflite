import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/entities/wish.dart';

class WishModel extends Wish{


  WishModel({required super.id,required super.title,required super.description});

  factory WishModel.fromJson(Map<String,dynamic> json){
   return WishModel(id: json['id'], title: json['title'], description: json['description']);
  }

      Map<String,dynamic>  toJson(){
                return {
                  "id": id,
                  "title": title,
                  "description" : description
                };
      }
}