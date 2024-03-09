import 'package:flutter/material.dart';
import '../constants/color_constants.dart';
import '../models/todo_model.dart';
import '../services/database_helper.dart';
import '../widgets/todo_widget.dart';
import 'todo_ekle_duzenle_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool ischecked = false;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('İbrahim\'in Yapılacaklar Listesi',
              style: TextStyle(color: DegismezRenkler.renk4)),
          centerTitle: true,
          backgroundColor: DegismezRenkler.renk),
      backgroundColor: DegismezRenkler.renk1,
      floatingActionButton: FloatingActionButton(
        backgroundColor: DegismezRenkler.renk,
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TodoScreen()));
          setState(() {});
        },
        child: Icon(Icons.add, color: DegismezRenkler.renk4),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              child: FutureBuilder<List<Todo>?>(
                future: DatabaseHelper.getAllTodos(),
                builder: (context, AsyncSnapshot<List<Todo>?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      return ListView.builder(
                        itemBuilder: (context, index) => TodoWidget(
                            guncelle: () {
                              setState(() {});
                            },
                            todo: snapshot.data![index],
                            edit: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TodoScreen(
                                    todo: snapshot.data![index],
                                  ),
                                ),
                              );
                              setState(() {});
                            },
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TodoScreen(
                                    todo: snapshot.data![index],
                                  ),
                                ),
                              );
                              setState(() {});
                            },
                            delete: () async {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: DegismezRenkler.renk1,
                                      title: Text(
                                          'Silmek istediğine emin misin?',
                                          style: TextStyle(
                                              color: DegismezRenkler.renk4)),
                                      actions: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      DegismezRenkler.renk)),
                                          onPressed: () async {
                                            await DatabaseHelper.deleteTodo(
                                                snapshot.data![index]);
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          child: const Text('Evet',
                                              style:
                                                  TextStyle(color: Colors.red)),
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      DegismezRenkler.renk)),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text('Hayır',
                                              style: TextStyle(
                                                  color:
                                                      DegismezRenkler.renk5)),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            ischecked: snapshot.data![index].yapildiMi == 0
                                ? false
                                : true),
                        itemCount: snapshot.data!.length,
                      );
                    }
                  } else {
                    return const Center(
                      child: Text(
                        'Henüz yapacağın bir şey yok!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
          Expanded(flex: 1, child: Container())
        ],
      ),
    );
  }
}
