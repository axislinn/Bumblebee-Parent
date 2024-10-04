
import 'package:bumblebee/bloc/join_class_bloc.dart/join_class_bloc.dart';
import 'package:bumblebee/bloc/join_class_bloc.dart/join_class_event.dart';
import 'package:bumblebee/bloc/join_class_bloc.dart/join_class_state.dart';
import 'package:bumblebee/data/repository/repositories/join_class_repository.dart';
import 'package:bumblebee/screens/navi_drawer/drawer/class_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class JoinClassPage extends StatelessWidget {
  final JoinClassBloc joinClassBloc =
      JoinClassBloc(joinclassRepository: JoinClassRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Class'),
      ),
      body: BlocProvider(
        create: (context) => joinClassBloc,
        child: JoinClassForm(),
      ),
    );
  }
}

// Join Class Form
class JoinClassForm extends StatefulWidget {
  @override
  _JoinClassFormState createState() => _JoinClassFormState();
}

class _JoinClassFormState extends State<JoinClassForm> {
  final _classCodeController = TextEditingController();
  final _childNameController = TextEditingController();
  final _studentDOBController = TextEditingController();

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return BlocListener<JoinClassBloc, JoinClassState>(
      listener: (context, state) {
        if (state is JoinClassSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Joined class successfully')));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ClassListPage()),
          );
        } else if (state is JoinClassFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to join class: ${state.error}')));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _classCodeController,
              decoration: const InputDecoration(labelText: 'Class Code'),
            ),
            TextField(
              controller: _childNameController,
              decoration: const InputDecoration(labelText: 'Child Name'),
            ),
            TextFormField(
              controller: _studentDOBController,
              decoration: const InputDecoration(
                labelText: 'Date of Birth',
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  setState(() {
                    selectedDate = pickedDate;
                    _studentDOBController.text =
                        "${pickedDate.toLocal()}".split(' ')[0];
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final classCode = _classCodeController.text;
                final childName = _childNameController.text;

                DateTime? studentDOB;
                if (_studentDOBController.text.isNotEmpty) {
                  studentDOB = DateTime.parse(_studentDOBController.text);
                }

                if (studentDOB != null) {
                  context.read<JoinClassBloc>().add(JoinButtonPressed(
                        classCode: classCode,
                        childName: childName,
                        studentDOB: selectedDate!,
                      ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please select a valid date of birth')),
                  );
                }
              },
              child: const Text('Join'),
            )
          ],
        ),
      ),
    );
  }
}
