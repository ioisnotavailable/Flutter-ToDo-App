class Todo {
  final int? id;
  final String metin;
  int? yapildiMi;
  bool? ischecked;

  Todo(
      {required this.metin,
      required this.yapildiMi,
      this.id,
      this.ischecked = false});

  factory Todo.fromJason(Map<String, dynamic> jason) => Todo(
        id: jason['id'],
        metin: jason['metin'],
        yapildiMi: jason['yapildiMi'],
      );

  Map<String, dynamic> toJason() => {
        'id': id,
        'metin': metin,
        'yapildiMi': yapildiMi,
      };
}
