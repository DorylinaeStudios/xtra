<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

<!--
TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.
-->
Some xtra useful datatypes. Currently in delevlopment.

Implemented Datatypes:
- XSet, emulates a database, holds collection of tables
- XTable, emulates a database table
- XColumn, used by XTable to represent Columns
- XRow, used by XTable to represent Rows

<!--
## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.
-->

<!--
## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.
-->

## Usage

<!--
TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
const like = 'sample';
```
-->
```dart
XSet xSet = XSet("MyXSet");

xSet.addXTable("MyXTable");

xSet.tables["MyXTable"].addXColumn("Index", int, autoInc: true);
xSet.tables["MyXTable"].addXColumn("First Name", String);
xSet.tables["MyXTable"].addXColumn("Last Name", String);

xSet.tables["MyXTable"].addXRow({"First Name": "John", "Last Name": "Doe"});

print(xSet.tables["MyXTable"].rows[0]);
```
Output:
```{Index: 0, First Name: John, Last Name: Doe}```

## Additional information

<!--
TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
-->
Currently maintained by Dorylinae Studios™
Contact: dorylinae.studios@gmail.com