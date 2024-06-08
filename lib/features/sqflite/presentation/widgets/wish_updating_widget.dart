

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/presentation/bloc/wish/wish_bloc.dart';

import '../../domain/entities/wish.dart';

class WishUpdatingWidget extends StatefulWidget {
  final Wish wish;
  const WishUpdatingWidget({super.key, required this.wish});

  @override
  State<WishUpdatingWidget> createState() => _WishUpdatingWidgetState();
}

class _WishUpdatingWidgetState extends State<WishUpdatingWidget> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
   @override
  void initState() {

    super.initState();
    titleController.text = widget.wish.title;
    descriptionController.text = widget.wish.description;

  }
  @override
  void dispose() {

    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 30,
                    width: 200,
                    child: TextField(
                      controller: titleController,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 30,
                    width: 200,
                    child: TextField(
                      controller: descriptionController,
                    ),
                  )
                ],
              ),

              const Expanded(child: SizedBox()),
              TextButton(onPressed: (){
                 context.read<WishBloc>().add(WishUpdate(Wish(title: titleController.text,
                     description: descriptionController.text, id: widget.wish.id)));
              }, child: const Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
