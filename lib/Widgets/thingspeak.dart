import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchDataFromThingSpeak(
    String channelId, String apiKey) async {
  final String url =
      'https://api.thingspeak.com/channels/$channelId/feeds.json?api_key=$apiKey';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Failed to load data from ThingSpeak');
  }
}
