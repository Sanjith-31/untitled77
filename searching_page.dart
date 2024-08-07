import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchingPage extends StatefulWidget {
  @override
  _SearchingPageState createState() => _SearchingPageState();
}

class _SearchingPageState extends State<SearchingPage> {
  List<dynamic> _searchResults = [];
  bool _isLoading = true;
  final String _apiKey = 'YOUR_API_KEY'; // Replace with your API key
  final String _searchEngineId = 'YOUR_SEARCH_ENGINE_ID'; // Replace with your Search Engine ID

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final query = ModalRoute.of(context)!.settings.arguments as String;
    _fetchSearchResults(query);
  }

  Future<void> _fetchSearchResults(String query) async {
    setState(() {
      _isLoading = true;
    });

    final url = 'https://www.googleapis.com/customsearch/v1?q=$query&key=$_apiKey&cx=$_searchEngineId';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // Debugging: Print the raw data
        print('Raw data: ${json.encode(data)}');
        setState(() {
          _searchResults = data['items'] ?? [];
          _isLoading = false;
        });
      } else {
        print('Error: ${response.statusCode}');
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Exception: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Results')),
      body: _isLoading
          ? Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => ListTile(
            title: Container(
              color: Colors.white,
              height: 20,
              width: double.infinity,
            ),
          ),
        ),
      )
          : _searchResults.isEmpty
          ? Center(child: Text('No results found'))
          : ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          final item = _searchResults[index];
          return ListTile(
            title: Text(item['title'] ?? 'No Title'),
            subtitle: Text(item['snippet'] ?? 'No Snippet'),
            onTap: () {
              // Optionally, handle item tap
            },
          );
        },
      ),
    );
  }
}
