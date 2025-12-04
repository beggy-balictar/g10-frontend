import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // For PC testing:
 final String baseUrl = "http://localhost:5000";

  // For Android Emulator:
  // static const String baseUrl = "http://10.0.2.2:5000/api";

  /* ------------------------------------------------------------
   * LOGGING ROUTES
   * ------------------------------------------------------------ */

  /// POST /api/logging/login
  static Future<Map<String, dynamic>> login(String email) async {
    final url = Uri.parse("http://localhost:5000/api/logging");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email}),
    );

    return jsonDecode(response.body);
  }

  /* ------------------------------------------------------------
   * INQUIRY ROUTES
   * ------------------------------------------------------------ */

  /// POST /api/inquiries/process
  static Future<Map<String, dynamic>> sendInquiry(
      String email, String inquiryText) async {
    final url = Uri.parse("http://localhost:5000/api/inquiries");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "inquiryText": inquiryText,
      }),
    );

    return jsonDecode(response.body);
  }

  /// GET /api/inquiries/history/:email
  static Future<Map<String, dynamic>> getInquiryHistory(String email) async {
    final url = Uri.parse("http://localhost:5000/api/inquiries");

    final response = await http.get(url);
    return jsonDecode(response.body);
  }

  /* ------------------------------------------------------------
   * DEPARTMENTS ROUTES
   * ------------------------------------------------------------ */

  /// GET /api/departments
  static Future<Map<String, dynamic>> getDepartments() async {
    final url = Uri.parse("http://localhost:5000/api/departments");

    final response = await http.get(url);
    return jsonDecode(response.body);
  }

  /* ------------------------------------------------------------
   * KNOWLEDGE BASE ROUTES
   * ------------------------------------------------------------ */

  /// GET /api/knowledgebase
  static Future<Map<String, dynamic>> getKnowledgeBase() async {
    final url = Uri.parse("http://localhost:5000/api/knowledgeBase");

    final response = await http.get(url);
    return jsonDecode(response.body);
  }

  /* ------------------------------------------------------------
   * FEEDBACK ROUTES
   * ------------------------------------------------------------ */

  /// POST /api/feedback
  static Future<Map<String, dynamic>> submitFeedback(
      String email, String inquiryId, int rating, String comment) async {
    final url = Uri.parse("http://localhost:5000/api/feedback");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "inquiryId": inquiryId,
        "rating": rating,
        "comment": comment,
      }),
    );

    return jsonDecode(response.body);
  }

  /// GET /api/feedback
  static Future<Map<String, dynamic>> getAllFeedback() async {
    final url = Uri.parse("http://localhost:5000/api/feedback");

    final response = await http.get(url);
    return jsonDecode(response.body);
  }
}