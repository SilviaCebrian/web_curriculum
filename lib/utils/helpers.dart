import 'package:url_launcher/url_launcher.dart' as launcher;

void launchURL(Uri uri) async {
  if (await launcher.canLaunchUrl(uri)) {
    await launcher.launchUrl(uri);
  } else {
    throw 'Could not launch $uri';
  }
}

//TODO: ver si funciona en release EL MAILTO
void mailTo() {
  final Uri uri = Uri(
      scheme: 'mailto',
      path: 'silviacebrianruiz@gmail.com',
      query: 'subject=Default Subject&body=Default body');
  launchURL(uri);
}

void linkedin() {
  final Uri uri = Uri(
      scheme: 'https', host: 'linkedin.com', path: '/in/silvia-c-95a434169/');
  launchURL(uri);
}

void github() {
  final Uri uri =
      Uri(scheme: 'https', host: 'github.com', path: '/SilviaCebrian');
  launchURL(uri);
}

void telegram() {
//No se puede abrir chat directamente, lo caparon porque la peña metia scripts y tal.
  final Uri uri = Uri(scheme: 'https', host: 't.me', path: 'DRaGuNia');
  launchURL(uri);
}

void twitter() {
  //https://x.com/messages/compose?recipient_id=1547645779
  final Uri uri = Uri(
      scheme: 'https',
      host: 'x.com',
      path: '/messages/compose',
      queryParameters: {'recipient_id': '1547645779'});
  launchURL(uri);
}
