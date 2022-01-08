import 'package:flutter/material.dart';
import 'contact_data.dart';

class ContactViewPage extends StatelessWidget {
  final Post user;

  ContactViewPage({required this.user}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(user.Name),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Text('Телефон: ${user.Phone}', style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 60))),
            Text('Должность: ${user.Data}', style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 60))),
            Text('Компания: ${user.Company}', style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 60))),

  ]
        )
    )
    );
  }

}
