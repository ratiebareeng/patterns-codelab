import 'package:flutter/material.dart';
import 'package:patterns_codelab/data.dart';

void main() {
  runApp(const DocumentApp());
}

class DocumentApp extends StatelessWidget {
  const DocumentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: DocumentScreen(
          document: Document(),
        ),
      ),
    );
  }
}

// Document Screen
class DocumentScreen extends StatelessWidget {
  final Document document;

  const DocumentScreen({
    required this.document,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// Some patterns, when they match, destructure the matched value by pulling data out of it.
    /// Destructuring lets you unpack values from an object to assign them to local variables,
    /// or perform further matching on them.
    /// The record pattern (title, modified: modified) contains two variable patterns that match against the fields of the record returned by metadata.

    /// The expression matches the subpattern because the result is a record with two fields, one of which is named modified.
    /// Because they match, the variable declaration pattern destructures the expression, accessing its values and binding them to new local variables of the same types and names, String title and DateTime modified.
    /// There is a shorthand for when the name of a field and the variable populating it are the same. Refactor the build method of DocumentScreen as follows.
    /// final (title, modified: modified) = document.metadata;
    /// The syntax of the variable pattern :modified is shorthand for modified: modified. If you want a new local variable of a different name, you can write modified: localModified instead.
    final (title, :modified) = document.metadata;
    return Scaffold(
      appBar: AppBar(
        /// To get a positional field (a field without a name, like title),
        /// use the getter $<num> on the record. This returns only unnamed fields.
        title: Text(title),
      ),
      body: Column(
        children: [
          Center(
            /// Named fields like modified don't have a positional getter,
            /// so you can use its name directly, like metadataRecord.modified.
            child: Text('Last modified $modified'),
          ),
        ],
      ),
    );
  }
}
