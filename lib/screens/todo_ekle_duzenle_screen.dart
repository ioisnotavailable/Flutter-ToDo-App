import 'package:flutter/material.dart';
import '../constants/color_constants.dart';
import '../models/todo_model.dart';
import '../services/database_helper.dart';

class TodoScreen extends StatelessWidget {
  final Todo? todo;
  const TodoScreen({Key? key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final metinController = TextEditingController();

    if (todo != null) {
      metinController.text = todo!.metin.substring(1);
    }

    // return Scaffold(
    //   backgroundColor: DegismezRenler.renk1,
    //   appBar: AppBar(
    //     automaticallyImplyLeading: false,
    //     backgroundColor: DegismezRenler.renk,
    //     title: Text(todo == null ? 'Bir etkinlik ekle' : 'Etkinliği düzenle',
    //         style: TextStyle(color: DegismezRenler.renk4)),
    //     centerTitle: true,
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
    //     child: Column(
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.only(bottom: 40),
    //           child: Center(
    //             child: Text(
    //               'Ne düşünüyorsun?',
    //               style: TextStyle(
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.bold,
    //                   color: DegismezRenler.renk5),
    //             ),
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(bottom: 40.0),
    //           // child: TextField(
    //           //   style: TextStyle(color: Colors.white),
    //           //   controller: metinController,
    //           //   maxLines: 3,
    //           //   decoration: InputDecoration(
    //           //       hintText: 'Yapılacak',
    //           //       hintStyle: TextStyle(color: DegismezRenler.renk5),
    //           //       labelStyle: TextStyle(color: DegismezRenler.renk5),
    //           //       labelText: 'Yapılacak etkinliği gir',
    //           //       border: OutlineInputBorder(
    //           //           borderRadius: BorderRadius.circular(10.0),
    //           //           borderSide: BorderSide())
    //           //       // const OutlineInputBorder(
    //           //       //   borderSide: BorderSide(
    //           //       //     color: Colors.red,
    //           //       //     width: 11.0,
    //           //       //   ),
    //           //       //   borderRadius: BorderRadius.all(
    //           //       //     Radius.circular(10.0),
    //           //       //   ),
    //           //       // ),
    //           //       ),
    //           // ),
    //           child: TextFormField(
    //             controller: metinController,
    //             enableSuggestions: false,
    //             autocorrect: false,
    //             maxLength: 500,
    //             maxLines: 5,
    //             decoration: const InputDecoration(
    //               enabledBorder: OutlineInputBorder(
    //                 borderSide: BorderSide(color: Colors.white),
    //               ),
    //               focusedBorder: OutlineInputBorder(
    //                 borderSide: BorderSide(color: Colors.white),
    //               ),
    //               fillColor: Colors.white,
    //               filled: true,
    //               counterText: "",
    //               hintText: '',
    //               labelText: '',
    //               labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
    //               contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
    //             ),
    //           ),
    //         ),
    //         const Spacer(),
    //         Padding(
    //           padding: const EdgeInsets.only(bottom: 20.0),
    //           child: SizedBox(
    //             height: 45,
    //             width: MediaQuery.of(context).size.width,
    //             child: ElevatedButton(
    //               onPressed: () async {
    //                 final metin = 'ㅤ' + metinController.value.text;
    //
    //                 if (metinController.value.text.isEmpty) {
    //                   return;
    //                 }
    //
    //                 final Todo model = Todo(
    //                     metin: metin, yapildiMi: todo?.yapildiMi, id: todo?.id);
    //                 if (todo == null) {
    //                   await DatabaseHelper.addTodo(model);
    //                 } else {
    //                   await DatabaseHelper.updateTodo(model);
    //                 }
    //
    //                 Navigator.pop(context);
    //               },
    //               style: ButtonStyle(
    //                   backgroundColor:
    //                       MaterialStateProperty.all(DegismezRenler.renk),
    //                   shape: MaterialStateProperty.all(RoundedRectangleBorder(
    //                       side: BorderSide(
    //                         color: DegismezRenler.renk,
    //                         width: 0.75,
    //                       ),
    //                       borderRadius: const BorderRadius.all(
    //                         Radius.circular(10.0),
    //                       )))),
    //               child: Text(
    //                 todo == null ? 'Kaydet' : 'Düzenle',
    //                 style: TextStyle(fontSize: 20, color: DegismezRenler.renk5),
    //               ),
    //             ),
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(bottom: 20.0),
    //           child: SizedBox(
    //             height: 45,
    //             width: MediaQuery.of(context).size.width,
    //             child: ElevatedButton(
    //               onPressed: () {
    //                 Navigator.pop(context);
    //               },
    //               style: ButtonStyle(
    //                 backgroundColor:
    //                     MaterialStateProperty.all(DegismezRenler.renk),
    //                 shape: MaterialStateProperty.all(
    //                   RoundedRectangleBorder(
    //                     side: BorderSide(
    //                       color: DegismezRenler.renk,
    //                       width: 0.75,
    //                     ),
    //                     borderRadius: const BorderRadius.all(
    //                       Radius.circular(10.0),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               child: const Text(
    //                 'İptal',
    //                 style: TextStyle(fontSize: 20, color: Colors.red),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    return Scaffold(
      backgroundColor: DegismezRenkler.renk1,
      appBar: AppBar(
        backgroundColor: DegismezRenkler.renk,
        centerTitle: true,
        title: Text(
          todo == null ? 'Bir Etkinlik Ekle' : 'Düzenle',
          style: TextStyle(color: DegismezRenkler.renk4),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ne Düşünüyorsun?',
              style: TextStyle(color: DegismezRenkler.renk5, fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: DegismezRenkler.renk2,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: metinController,
                    maxLines: 6,
                    maxLength: 200,
                    decoration: InputDecoration(
                      // hintText: 'Yapılacak',
                      hintStyle: TextStyle(color: DegismezRenkler.renk5),
                      labelStyle: TextStyle(color: DegismezRenkler.renk5),
                      counterText: '',
                      counterStyle: null,
                      // labelText: 'Yapılacak etkinliği gir',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    final metin = 'ㅤ' + metinController.value.text;

                    if (metinController.value.text.isEmpty) {
                      return;
                    }

                    final Todo model = Todo(
                        metin: metin, yapildiMi: todo?.yapildiMi, id: todo?.id);
                    if (todo == null) {
                      await DatabaseHelper.addTodo(model);
                    } else {
                      await DatabaseHelper.updateTodo(model);
                    }

                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(DegismezRenkler.renk),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: BorderSide(
                            color: DegismezRenkler.renk,
                            width: 0.75,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          )))),
                  child: Text(
                    todo == null ? 'Kaydet' : 'Düzenle',
                    style:
                        TextStyle(fontSize: 20, color: DegismezRenkler.renk5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(DegismezRenkler.renk),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        side: BorderSide(
                          color: DegismezRenkler.renk,
                          width: 0.75,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  child: const Text(
                    'İptal',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
