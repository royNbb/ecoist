import 'package:ecoist/participate/page/tes_participants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ecoist/participate/model/participation.dart';


Future<List<Participants>> fetchParticipants() async {
  var url = Uri.parse('http://127.0.0.1:8000/participate/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<Participants> listPartisipan = [];

  for (var d in data) {
    if (d != null) {
      listPartisipan.add(Participants.fromJson(d));
    }
  }
  return listPartisipan;
}

void join(request, nama, email, nomor, help, reason) async {
  await request.post(
      'http://127.0.0.1:8000/participate/flutter_campaign/',
      {"nama_pendaftar": nama, "email_pendaftar": email, "phone_number": nomor,
      "what_can_you_help_with": help, "reason_to_participate": reason});
}