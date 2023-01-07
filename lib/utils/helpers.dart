import 'package:url_launcher/url_launcher.dart' as launcher;

void launchURL(Uri _uri) async {
  if (await launcher.canLaunchUrl(_uri)) {
    await launcher.launchUrl(_uri);
  } else {
    throw 'Could not launch $_uri';
  }
}

//TODO: ver si funciona en release EL MAILTO
void mailTo() {
  Uri _uri = Uri(
      scheme: 'mailto',
      path: 'silviacebrianruiz@gmail.com',
      query: 'subject=Default Subject&body=Default body');
  launchURL(_uri);
}

void linkedin() {
  Uri _uri = Uri(
      scheme: 'https',
      host: 'linkedin.com',
      path: '/in/silvia-cebri%C3%A1n-ruiz-95a434169/');
  launchURL(_uri);
}

void github() {
  Uri _uri = Uri(scheme: 'https', host: 'github.com', path: '/SilviaCebrian');
  launchURL(_uri);
}

void telegram() {
//No se puede abrir chat directamente, lo caparon porque la peña metia scripts y tal.
  Uri _uri = Uri(scheme: 'https', host: 't.me', path: 'DRaGuNia');
  launchURL(_uri);
}

void twitter() {
  //https://twitter.com/messages/compose?recipient_id=1547645779
  Uri _uri = Uri(
      scheme: 'https',
      host: 'twitter.com',
      path: '/messages/compose',
      queryParameters: {'recipient_id': '1547645779'});
  launchURL(_uri);
}
