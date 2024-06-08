class Wish{
   int? id;
   bool isEditing;
 final String title;
 final String description;

    Wish( {required this.title,required this.description, this.id ,this.isEditing = false });


    Wish copyWith({int? id, bool? isEditing, String? title, String? description}){
      return Wish(
          id: id ?? this.id,
           isEditing: isEditing ?? this.isEditing,
          title: title ?? this.title,
          description: description ?? this.description);

    }
}

