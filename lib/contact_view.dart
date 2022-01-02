import 'package:flutter/material.dart';
import 'contact_data.dart';
import 'contact_details.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {

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
  final List<User> _users;

  ContactList(this._users);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: _users.length,
      itemBuilder: _buildContacts,
    );
  }

  Widget _buildContacts(context, index) {
    return ContactItem(_users[index]);
  }

}

class ContactItem extends StatelessWidget {
  const ContactItem(this.user);

  final User user;

  Widget _buildTiles(BuildContext context, User user) {
    return ListTile(
      title: Text(user.Name),
      subtitle: Text(user.Phone),
      leading: CircleAvatar(
        child: Text(user.Name[0]),
      ),
      trailing: Icon(Icons.phone_enabled),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ContactViewPage(user: user,);
               return Scaffold(
                 appBar: AppBar(
                   title: Text(user.Name)
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
