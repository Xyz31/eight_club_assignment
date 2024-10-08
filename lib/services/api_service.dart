import 'package:dio/dio.dart';

import 'package:project_eight_second/model/experiences.dart';

class ExperienceController {
  final Dio _dio = Dio();

  Future<List<Experience>> fetchExperiences() async {
    try {
      final response =
          await _dio.get('https://staging.cos.8club.co/experiences');

      if (response.statusCode == 200) {
        // Parse the list of experiences from the response
        List<dynamic> data = response.data['data']
            ['experiences']; // Adjust to match the API response structure
        // Map each JSON object in the list to an Experience model
        List<Experience> experiences =
            data.map((item) => Experience.fromJson(item)).toList();
        return experiences;
      } else {
        throw Exception('Failed to load experiences: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load experiences: $e');
    }
  }
}
