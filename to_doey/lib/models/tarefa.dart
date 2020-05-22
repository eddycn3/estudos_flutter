class Tarefa {
  String titulo;
  bool isDone;

  Tarefa({this.titulo, this.isDone = false});

  Map<String, dynamic> toJson() => {"titulo": titulo, "isDone": isDone};

  updateTask() {
    isDone = !isDone;
  }
}
