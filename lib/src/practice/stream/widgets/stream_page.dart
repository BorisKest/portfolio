import 'package:flutter/material.dart';
import 'package:portfolio/src/common/widgets/drawer.dart';
import 'package:portfolio/src/model/contact.dart';
import 'package:portfolio/src/practice/stream/widgets/contact_bloc.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({Key? key}) : super(key: key);

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  ContactBloc contactBloc = ContactBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts'), actions: <Widget>[
        Chip(
          label: StreamBuilder<int>(
              stream: contactBloc.contactCounter,
              builder: (context, snapshot) {
                return Text(
                  (snapshot.data ?? 0).toString(),
                );
              }),
          backgroundColor: Colors.black26,
        )
      ]),
      drawer: const DrawerCreate(),
      body: StreamBuilder(
        stream: contactBloc.contactListView,
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              List<Contact>? contacts = snapshot.data;
              return ListView.separated(
                itemCount: contacts?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  Contact contact = contacts![index];
                  return ListTile(
                    title: Text(contact.name),
                    subtitle: Text(contact.email),
                    leading: const CircleAvatar(),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              );
          }
        },
      ),
    );
  }
}
