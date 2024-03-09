import 'package:flutter/material.dart';
import '../constants/color_constants.dart';
import '../models/todo_model.dart';
import '../services/database_helper.dart';

class TodoWidget extends StatelessWidget {
  Todo todo;
  final VoidCallback edit;
  final VoidCallback onTap;
  final VoidCallback delete;
  final VoidCallback guncelle;
  bool ischecked;
  TodoWidget(
      {super.key,
      required this.todo,
      required this.ischecked,
      required this.delete,
      required this.onTap,
      required this.guncelle,
      required this.edit});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: Card(
          color: DegismezRenkler.renk2,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  activeColor: DegismezRenkler.renk5,
                  value: ischecked,
                  onChanged: (newvalue) async {
                    guncelle;
                    ischecked == false
                        ? todo.yapildiMi = 1
                        : todo.yapildiMi = 0;
                    todo.yapildiMi == 1
                        ? ischecked == true
                        : ischecked == false;

                    Todo model = Todo(
                        metin: todo.metin,
                        yapildiMi: todo.yapildiMi,
                        id: todo.id);

                    await DatabaseHelper.updateTodo(model);
                    // setState(() {});

                    return guncelle();

                    // print('yenilendi');
                  },
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    child: Text(
                      todo!.metin.substring(1),
                      style: TextStyle(
                          decoration: ischecked == true
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          fontWeight: FontWeight.w400,
                          color: ischecked == false
                              ? DegismezRenkler.renk4
                              : Colors.white24,
                          fontSize: 15.0),
                      overflow: TextOverflow.fade,
                      maxLines: 5,
                      softWrap: true,
                    ),
                  ),
                ),
                // IconButton(
                //   onPressed: edit,
                //   icon: const Icon(Icons.edit, color: Colors.white),
                // ),
                IconButton(
                  onPressed: delete,
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
                // Row(
                //   children: [
                //     // Checkbox(
                //     //   value: ischecked,
                //     //   onChanged: (newvalue) async {
                //     //     guncelle;
                //     //     ischecked == false
                //     //         ? todo.yapildiMi = 1
                //     //         : todo.yapildiMi = 0;
                //     //     todo.yapildiMi == 1
                //     //         ? ischecked == true
                //     //         : ischecked == false;
                //     //
                //     //     Todo model = Todo(
                //     //         metin: todo.metin,
                //     //         yapildiMi: todo.yapildiMi,
                //     //         id: todo.id);
                //     //
                //     //     await DatabaseHelper.updateTodo(model);
                //     //     // setState(() {});
                //     //
                //     //     return guncelle();
                //     //
                //     //     // print('yenilendi');
                //     //   },
                //     // ),
                //     // Container(
                //     //   child: Text(
                //     //     todo!.metin,
                //     //     style: TextStyle(
                //     //         decoration: ischecked == true
                //     //             ? TextDecoration.lineThrough
                //     //             : TextDecoration.none,
                //     //         fontWeight: FontWeight.w400,
                //     //         color:
                //     //             ischecked == false ? Colors.white : Colors.grey,
                //     //         fontSize: 15.0),
                //     //     overflow: TextOverflow.fade,
                //     //     maxLines: 1,
                //     //     softWrap: false,
                //     //   ),
                //     // ),
                //   ],
                // ),
                // Row(
                //   children: [
                //     // IconButton(
                //     //   onPressed: edit,
                //     //   icon: const Icon(Icons.edit, color: Colors.white),
                //     // ),
                //     // IconButton(
                //     //   onPressed: delete,
                //     //   icon: const Icon(Icons.delete, color: Colors.red),
                //     // ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
