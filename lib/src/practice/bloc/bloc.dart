import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

@immutable
abstract class LoadAction {
  const LoadAction();
}

@immutable
class LoadPersonsAction implements LoadAction {
  final PersonUrl url;

  const LoadPersonsAction({required this.url}) : super();
}

enum PersonUrl {
  personse1,
  personse2,
}

extension UrlString on PersonUrl {
  String get urlString {
    switch (this) {
     
  }
}

@immutable
class Person {
  final String name;
  final int age;

  const Person({
    required this.name,
    required this.age,
  });

  Person.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        age = json['age'] as int;

  @override
  String toString() => 'Person (name: $name, age: $age)';
}

Future<Iterable<Person>> getPersons(String url) => HttpClient()
    .getUrl(Uri.parse(url)) //give us request
    .then((req) => req.close()) //comes response
    .then((resp) => resp.transform(utf8.decoder).join()) // response to string
    .then((str) => json.decode(str) as List<dynamic>) // string to list
    .then((list) =>
        list.map((e) => Person.fromJson(e))); // list to Iterable of persons

@immutable
class FethcResult {
  final Iterable<Person> persons;
  final bool isRetrievedFromCache;
  const FethcResult({
    required this.persons,
    required this.isRetrievedFromCache,
  });

  @override
  toString() =>
      'FechResult (isRetrievedFromCache = $isRetrievedFromCache, persons = $persons)';
}

extension Subscription<T> on Iterable<T> {
  T? operator [](int index) => length > index ? elementAt(index) : null;
}

class PersonsBloc extends Bloc<LoadAction, FethcResult?> {
  final Map<PersonUrl, Iterable<Person>> _cache = {};
  PersonsBloc() : super(null) {
    on<LoadPersonsAction>(
      (event, emit) async {
        final url = event.url;
        if (_cache.containsKey(url)) {
          final cachedPersins = _cache[url]!;
          final result = FethcResult(
            persons: cachedPersins,
            isRetrievedFromCache: true,
          );
          emit(result);
        } else {
          final persons = await getPersons(url.urlString);
          _cache[url] = persons;
          final result = FethcResult(
            persons: persons,
            isRetrievedFromCache: false,
          );
          emit(result);
        }
      },
    );
  }
}

class BlocScreen extends StatefulWidget {
  const BlocScreen({Key? key}) : super(key: key);

  @override
  State<BlocScreen> createState() => _BlocScreenState();
}

class _BlocScreenState extends State<BlocScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  context.read<PersonsBloc>().add(
                        const LoadPersonsAction(
                          url: PersonUrl.personse1,
                        ),
                      );
                },
                icon: const Icon(Icons.download),
                label: const Text('Load jison 1'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  context.read<PersonsBloc>().add(
                        const LoadPersonsAction(
                          url: PersonUrl.personse2,
                        ),
                      );
                },
                icon: const Icon(Icons.download),
                label: const Text('Load jison 2'),
              ),
            ],
          ),
          BlocBuilder<PersonsBloc, FethcResult?>(
            buildWhen: (previousResult, currentResult) {
              return previousResult?.persons != currentResult?.persons;
            },
            builder: ((context, fetchResult) {
              fetchResult?.log();
              final persons = fetchResult?.persons;
              if (persons == null) {
                return const SizedBox(
                  height: 10,
                );
              }
              return SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: persons.length,
                  itemBuilder: ((context, index) {
                    final person = persons[index]!;
                    return ListTile(
                      title: Text(person.name),
                    );
                  }),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
