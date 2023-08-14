import 'dart:io';

String fixture(String name) =>
    File('lib/core/fixtures/$name').readAsStringSync();

void fixtureWrite(String name, String contents) => File('lib/core/fixtures/$name').writeAsString(contents, flush: true);
