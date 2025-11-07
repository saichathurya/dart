import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() {
  runApp(const GitHubApp());
}


class GitHubApp extends StatelessWidget {
  const GitHubApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub Repo Viewer',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const GitHubRepoScreen(),
    );
  }
}


class GitHubRepoScreen extends StatefulWidget {
  const GitHubRepoScreen({super.key});


  @override
  State<GitHubRepoScreen> createState() => _GitHubRepoScreenState();
}


class _GitHubRepoScreenState extends State<GitHubRepoScreen> {
  final TextEditingController _controller = TextEditingController();
  List<dynamic> _repos = [];
  bool _isLoading = false;
  String? _error;


  Future<void> _fetchRepos(String username) async {
    setState(() {
      _isLoading = true;
      _error = null;
      _repos = [];
    });


    final url = Uri.parse('https://api.github.com/users/$username/repos');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _repos = List.from(data);
        });
      } else {
        setState(() {
          _error = 'Error: ${response.statusCode} — Failed to load repos';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'An error occurred: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GitHub Repo Viewer')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter GitHub Username',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    final username = _controller.text.trim();
                    if (username.isNotEmpty) _fetchRepos(username);
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_error != null)
              Text(_error!, style: const TextStyle(color: Colors.red))
            else if (_repos.isEmpty)
              const Text('No repositories found.')
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _repos.length,
                  itemBuilder: (context, index) {
                    final repo = _repos[index];
                    return ListTile(
                      title: Text(repo['name']),
                      subtitle: Text(repo['description'] ?? 'No description'),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
