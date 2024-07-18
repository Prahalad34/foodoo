import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  late Future<String> _privacyPolicy;

  @override
  void initState() {
    super.initState();
    _privacyPolicy = fetchPrivacyPolicy();
  }

  Future<String> fetchPrivacyPolicy() async {
    final response = await http.get(Uri.parse('https://developers.facebook.com/tools/debug/sharing'));

    if (response.statusCode == 200) {
      // Parse the HTML content
      dom.Document document = parse(response.body);
      // Extract text content from the parsed HTML
      String plainText = document.body?.text ?? 'No content available';
      return plainText;
    } else {
      throw Exception('Failed to load privacy policy');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: FutureBuilder<String>(
        future: _privacyPolicy,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load privacy policy'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Text(snapshot.data ?? ''),
              ),
            );
          }
        },
      ),
    );
  }
}
