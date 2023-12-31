import 'dart:convert';
import 'package:http/http.dart' as http;

class BlogPostProvider {
  Future<List<Map<String, dynamic>>> fetchBlogPost() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    try {
      final response = await http.get(uri);
      final extractedData = json.decode(response.body) as List<dynamic>;
      final List<Map<String, dynamic>> blogPosts =
          extractedData.cast<Map<String, dynamic>>();
      return blogPosts;
    } catch (error) {
      throw Exception("Failed to load blog post");
    }
  }
}
