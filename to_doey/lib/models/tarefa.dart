class Tarefa {
  String titulo;
  bool isDone;

  Tarefa({this.titulo, this.isDone = false});

  concluirTarefa() {
    isDone = !isDone;
  }
}
