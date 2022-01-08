import 'package:flutter/material.dart';
import 'contact_data.dart';
import 'contact_details.dart';
import 'package:http/http.dart';
import 'dart:convert';

List<Post> users = [];

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);


  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {

  final url = "https://jsonplaceholder.typicode.com/posts";

  void fetchPosts() async {
    try {
      final response = await get(Uri.parse(url));

      final List<Post> jsonData = jsonDecode(response.body);

      setState(() {
        users = jsonData;
      });


    } catch (err){}

  }

  @override
  void initState(){
    super.initState();
    fetchPosts();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Контакты"),
        ),
        body: Container(
          child: ContactList(users),
        )
    );
  }
}

class ContactList extends StatelessWidget {
  final List _users;


  ContactList(this._users);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: users.length,
      itemBuilder: _buildContacts,
    );
  }

  Widget _buildContacts(context, index) {
    return ContactItem(_users[index]);
  }

}

class ContactItem extends StatelessWidget {
  const ContactItem(this.user);

  final Post user;

  Widget _buildTiles(BuildContext context, Post user) {
    return ListTile(
      title: Text(user.Title),
      subtitle: Text("ID ${user.id}"),
      leading: CircleAvatar(
        child: Text(user.Title[0]),
      ),
      trailing: Icon(Icons.phone_enabled),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ContactViewPage(user: user,);
               return Scaffold(
                 appBar: AppBar(
                   title: Text(user.Title)
                 ),
                 body: Text('Hello'),
               );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(context, user);
  }
}
