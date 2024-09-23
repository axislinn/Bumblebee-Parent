abstract class JoinClassEvent {}

class JoinButtonPressed extends JoinClassEvent {
  final String classCode;
  final String childName;
  final DateTime studentDOB;

  JoinButtonPressed({
    required this.classCode,
    required this.childName,
    required this.studentDOB,
  });
}
