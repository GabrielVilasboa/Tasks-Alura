import 'package:first_project/components/tasks.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Tasks> taskList = [
    Tasks(
        'Estudar Flutter',
        'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
        5),
    Tasks(
        'Andar de Bike',
        'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg',
        2),
    Tasks(
        'Ler',
        'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
        4),
    Tasks(
        'Meditar',
        'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
        3),
    Tasks('Jogar',
        'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg', 0),
  ];

  void newTask(String name, String photo, int difficult ){
    taskList.add(Tasks(name, photo, difficult));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
