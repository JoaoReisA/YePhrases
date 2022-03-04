import 'dart:io';

String fixture(String name) =>
    File('test/mocks/fixture/$name').readAsStringSync();
