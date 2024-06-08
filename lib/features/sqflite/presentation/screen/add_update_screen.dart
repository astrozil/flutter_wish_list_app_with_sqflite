import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wish_list_app_with_room/features/sqflite/domain/entities/wish.dart';

import 'package:flutter_wish_list_app_with_room/widgets/custom_text_field_widget.dart';

import '../bloc/wish/wish_bloc.dart';

class AddUpdateScreen extends StatefulWidget {
  final int id;
  const AddUpdateScreen({super.key, required this.id});

  @override
  State<AddUpdateScreen> createState() => _AddUpdateScreenState();
}



class _AddUpdateScreenState extends State<AddUpdateScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {

    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id == 0 ? "Add Wish" : "Update Wish"),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomTextFieldWidget(
                textEditingController: titleController, label: "Title"),
            const SizedBox(
              height: 20,
            ),
            CustomTextFieldWidget(
                textEditingController: descriptionController,
                label: "Description"),
            const SizedBox(
              height: 30,
            ),
            BlocListener<WishBloc, WishState>(
              listener: (context, state) {
               if(state is WishAdded){
                 Navigator.pop(context,"Success");
               }
              },
              child: ElevatedButton(
                onPressed: () {
                  if (widget.id == 0) {
                    context.read<WishBloc>().add(AddWish(Wish(title: titleController.text.trim(),description: descriptionController.text.trim())));
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: Text(
                  widget.id == 0 ? "Add Wish" : "Update Wish",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
