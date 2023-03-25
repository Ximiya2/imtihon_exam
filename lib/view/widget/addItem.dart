import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/cards_model.dart';
import '../../service/card_service.dart';
import '../../service/utils_service.dart';

class MyDialog extends StatefulWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  String _gender = "male";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Enter Details"),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Cost',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter age';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _dateController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'date',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter salary';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: "male",
                    groupValue: _gender,
                    onChanged: (String? value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  Text("Male"),
                  SizedBox(width: 10),
                  Radio(
                    value: "female",
                    groupValue: _gender,
                    onChanged: (String? value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  Text("Female"),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              CardsModel newCards = CardsModel(
                  name: _nameController.text,
                  number: _numberController.text,
                  cost: '2 975.00 сум',
                  date: _dateController.text,
                  id: '1');

              _createUser(newCards);
              Navigator.pop(context);
            }
          },
          child: Text('SAVE'),
        ),
      ],
    );
  }

  void _createUser(CardsModel newUser) async {
    bool result =
    await CardService.createUser(newUser);

    if(result){
      setState(() {});
      Utils.snackBarSucces('Create successfully', context);
    } else {
      Utils.snackBarError('Someting is wrong', context);
    }
  }

}
