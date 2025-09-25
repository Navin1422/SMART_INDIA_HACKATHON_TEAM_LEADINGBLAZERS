import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatService {
  // static const String baseUrl = "http://127.0.0.1:8000/api/chat/"; 
  static const String baseUrl = "http://10.0.2.2:8000/api/chat/";

  // replace with your server IP when deploying

  Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"message": message}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["reply"] ?? "No response";
      } else {
        return "Error: ${response.body}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
