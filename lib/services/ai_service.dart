import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {

  static Future<String> generateResponse({required String prompt, required String token}) async {
    try {
      final url = Uri.parse('https://openrouter.ai/api/v1/chat/completions');

      final body = jsonEncode({
        "model": "mistralai/mixtral-8x7b-instruct",
        "messages": [
          {"role": "user", "content": prompt},
        ],
      });

      print("🟢 [AIService] Sending request to: $url");
      print("🟡 [AIService] Request body: $body");

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token}', // Secure this!
        },
        body: body,
      );

      print("🔵 [AIService] Response status: ${response.statusCode}");
      print("🟣 [AIService] Raw response: ${response.body}");

      if (response.statusCode != 200) {
        return "⚠️ AI service returned status ${response.statusCode}. Please try again.";
      }

      final data = jsonDecode(response.body);
      final content = data['choices']?[0]?['message']?['content'];

      if (content != null && content.trim().isNotEmpty) {
        print("✅ [AIService] Parsed response: $content");
        return content.trim();
      }

      if (data['error'] != null) {
        print("❌ [AIService] API Error: ${data['error']}");
        return "AI Error: ${data['error']['message'] ?? data['error']}";
      }

      print("⚠️ [AIService] Unexpected response format: $data");
      return "I'm not sure, could you rephrase that?";
    } catch (e) {
      print("🔥 [AIService] Exception: $e");
      return "Sorry, I’m having trouble connecting to the AI service.";
    }
  }
}