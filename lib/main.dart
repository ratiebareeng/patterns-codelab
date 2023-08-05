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
    /// The metadata getter method returns a record, which is assigned to the local variable
    /// metadataRecord. Records are a light and easy way to return multiple values from a single
    /// function call and assign them to a variable.
    final metadataRecord = document.metadata;
    return Scaffold(
      appBar: AppBar(
        /// To get a positional field (a field without a name, like title),
        /// use the getter $<num> on the record. This returns only unnamed fields.
        title: Text(metadataRecord.$1),
      ),
      body: Column(
        children: [
          Center(
            /// Named fields like modified don't have a positional getter,
            /// so you can use its name directly, like metadataRecord.modified.
            child: Text('Last modified ${metadataRecord.modified}'),
          ),
        ],
      ),
    );
  }
}
