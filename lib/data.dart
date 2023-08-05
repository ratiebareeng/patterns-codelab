import 'dart:convert';

/// Imagine a program receiving data from an external source, like an I/O stream or HTTP request.
/// In this codelab, you simplify that more-realistic use case by mocking incoming JSON data with
/// a multi-line string in the documentJson variable.
class Document {
  final Map<String, Object?> _json;

  // constructor
  Document() : _json = jsonDecode(documentJson);

  /// The return type for this function is a record with two fields, one with the type String, and the other with the type DateTime.
  /// The first field is positional and unnamed, and the second field is named modified.
  (String, {DateTime modified}) get metadata {
    const title = 'My Document';
    final now = DateTime.now();

    /// The return statement constructs a new record by enclosing the two values in parenthesis, (title, modified: now).
    /// The first field is positional and unnamed, and the second field is named modified.
    return (title, modified: now);
  }
}

const documentJson = '''
{
  "metadata": {
    "title": "My Document",
    "modified": "2023-05-10"
  },
  "blocks": [
    {
      "type": "h1",
      "text": "Chapter 1"
    },
    {
      "type": "p",
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      "type": "checkbox",
      "checked": false,
      "text": "Learn Dart 3"
    }
  ]
}
''';
