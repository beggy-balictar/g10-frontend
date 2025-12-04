import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // For PC testing:
  static const String baseUrl = "http://192.168.254.101:5000"; 

  // For Android Emulator:
  // static const String baseUrl = "http://10.0.2.2:5000/api";

  /* ------------------------------------------------------------
   * LOGGING ROUTES
   * ------------------------------------------------------------ */

  /// POST /api/logging/login
  static Future<Map<String, dynamic>> login(String email) async {
    final url = Uri.parse("$baseUrl/logging/login");

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
    final url = Uri.parse("$baseUrl/inquiries/process");

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
    final url = Uri.parse("$baseUrl/inquiries$email");

    final response = await http.get(url);
    return jsonDecode(response.body);
  }

  /* ------------------------------------------------------------
   * DEPARTMENTS ROUTES
   * ------------------------------------------------------------ */

  /// GET /api/departments
  static Future<Map<String, dynamic>> getDepartments() async {
    final url = Uri.parse("$baseUrl/departments");

    final response = await http.get(url);
    return jsonDecode(response.body);
  }

  /* ------------------------------------------------------------
   * KNOWLEDGE BASE ROUTES
   * ------------------------------------------------------------ */

  /// GET /api/knowledgebase
  static Future<Map<String, dynamic>> getKnowledgeBase() async {
    final url = Uri.parse("$baseUrl/knowledgebase");

    final response = await http.get(url);
    return jsonDecode(response.body);
  }

  /* ------------------------------------------------------------
   * FEEDBACK ROUTES
   * ------------------------------------------------------------ */

  /// POST /api/feedback
  static Future<Map<String, dynamic>> submitFeedback(
      String email, String inquiryId, int rating, String comment) async {
    final url = Uri.parse("$baseUrl/feedback");

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
    final url = Uri.parse("$baseUrl/feedback");

    final response = await http.get(url);
    return jsonDecode(response.body);
  }
}