import 'dart:typed_data';

import 'package:http/http.dart' as http;

class VisionService {
  static const String apiKey =
      "f11954c7372a44cd8918220a2fac5d52"; //Azureden gelen api key
  static const String apiEndpoint =
      "https://virtualmuseumfrance.cognitiveservices.azure.com/vision/v3.2"; // * yerine Azure'de  Vision Studio'da oluşturulan proje ismi

  Future<String?> getImageDescription(Uint8List imageData) async {
    final String url =
        '$apiEndpoint/analyze?visualFeatures=Description&language=en&model-version=latest';

    try {
      final http.Client client = http.Client();
      final http.Response response = await client.post(
        Uri.parse(url),
        headers: {
          'Ocp-Apim-Subscription-Key': apiKey,
          'Content-Type': 'application/octet-stream',
        },
        body: imageData,
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        // Hata durumunda hatayı loglama veya işleme ekleme
        return null;
      }
    } catch (e) {
      // Hata durumunda hatayı loglama veya işleme ekleme
      return null;
    }
  }
}
