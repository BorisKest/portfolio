import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:portfolio/src/model/contact.dart';

class ContactServeice {
  static const String _url = ('https://jsonplaceholder.typicode.com/users');
  static Future browse() async {
    http.Response response = await http.get(Uri.parse(_url));

    await Future.delayed(const Duration(seconds: 3));

    String content = response.body;
    List collection = json.decode(content);
    List<Contact> contacts =
        collection.map((json) => Contact.fromJson(json)).toList();

    return contacts;
  }
}
