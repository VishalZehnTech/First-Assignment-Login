// ignore_for_file: file_names, library_private_types_in_public_api
import 'package:assignment_first_login/Models/User_Model.dart';
import 'package:assignment_first_login/Provider/List_Item_State.dart';
import 'package:flutter/material.dart';

class ListItemPage extends StatefulWidget {
  const ListItemPage({super.key});

  @override
  _ListItemPageState createState() => _ListItemPageState();
}

class _ListItemPageState extends State<ListItemPage> {
  ListItemState listItemService = ListItemState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text("List of User Data.",
            style: TextStyle(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan,
        actions: [
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.only(right: 5),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.exit_to_app)),
          ),
        ],
      ),
      body: FutureBuilder<UserModel?>(
        future: listItemService.getUserModel(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else if (snapshot.hasData && snapshot.data != null) {
            // if () {
            return ListView.builder(
              itemCount: snapshot.data!.data.length,
              itemBuilder: (context, index) {
                Datum user = snapshot.data!.data[index];
                return ListTile(
                  leading: CircleAvatar(
                    maxRadius: 30,
                    minRadius: 30,
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(user.email),
                  trailing: const Icon(Icons.message),
                );
              },
            );
            // }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
