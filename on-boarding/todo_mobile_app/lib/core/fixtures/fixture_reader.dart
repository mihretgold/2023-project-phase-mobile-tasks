import 'dart:io';

Future<String> fixture(String name) async =>   
 await File('lib/core/fixtures/$name').readAsString();

Future<void> fixtureWrite(String name, String contents) async => await File('lib/core/fixtures/$name').writeAsString(contents, flush: true);
