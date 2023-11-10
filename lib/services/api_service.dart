import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:termproject/YouTube_API/keys.dart'; // Import your API key or authentication method here
import 'package:termproject/models/channel_model.dart';
import 'package:termproject/models/video_model.dart';

class APIService {
  APIService._instantiate();

  static final APIService instance = APIService._instantiate();

  final String _baseUrl = 'www.googleapis.com';
  String _nextPageToken = '';

  Future<Channel> fetchChannel({required String channelId}) async {
    Map<String, String> parameters = {
      'part': 'snippet, contentDetails, statistics',
      'id': channelId,
      'key': API_KEY,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    );
    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    // Get Channel
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body)['items'][0];
      List<Video> videoList = await fetchVideosFromPlaylist
        (playlistId: data['contentDetails']['relatedPlaylists']['uploads']);
      Channel channel = Channel.fromMap(data, videoList);
      return channel;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }

  Future<List<Video>> fetchVideosFromPlaylist({required String playlistId}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playlistId,
      'maxResults': '10',
      'pageToken': _nextPageToken,
      'key': API_KEY, // Replace with your YouTube API key
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    // Get Playlist Videos
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      _nextPageToken = data['nextPageToken'] ?? '';
      List<dynamic> videosJson = data['items'];
      List<Video> videos = videosJson.map((video) => Video.fromMap(video['snippet'])).toList();
      return videos;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }
}
