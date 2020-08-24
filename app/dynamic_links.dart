import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share/share.dart';

Uri myLink;
Future<void> dynamicLink() async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    uriPrefix: 'https://rabotnik.page.link',
    //link: Uri.parse('https://rabotnik.page.link/H3Ed'),
    link: Uri.parse('https://cocreations.com.au/ext'),
    androidParameters: AndroidParameters(
      packageName: 'au.com.cocreations.psiapp',
      minimumVersion: 0,
    ),
    iosParameters: IosParameters(
      bundleId: 'au.com.cocreations.psiapp',
      minimumVersion: '0.0.0',
      appStoreId: 'TBD... TODO',
    ),
    googleAnalyticsParameters: GoogleAnalyticsParameters(
      campaign: 'xxexample-promo',
      medium: 'xxsocial',
      source: 'xxorkut',
    ),
    itunesConnectAnalyticsParameters: ItunesConnectAnalyticsParameters(
      providerToken: 'xx123456',
      campaignToken: 'xxexample-promo',
    ),
    socialMetaTagParameters: SocialMetaTagParameters(
      title: 'Psi Telepathy Test',
      description: 'Discover your psychic abilities.',
    ),
  );

  myLink = await parameters.buildUrl();
  Share.share('$myLink');
}

Future<void> dynamicLinkForThisApp() async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    uriPrefix: 'https://rabotnik.page.link',
    link: Uri.parse('https://rabotnik.page.link/H3Ed'),
    androidParameters: AndroidParameters(
      packageName: 'au.com.cocreations.psiapp',
      minimumVersion: 0,
    ),
    iosParameters: IosParameters(
      bundleId: 'au.com.cocreations.psiapp',
      minimumVersion: '0.0.0',
      appStoreId: 'TBD... TODO',
    ),
    googleAnalyticsParameters: GoogleAnalyticsParameters(
      campaign: 'xxexample-promo',
      medium: 'xxsocial',
      source: 'xxorkut',
    ),
    itunesConnectAnalyticsParameters: ItunesConnectAnalyticsParameters(
      providerToken: 'xx123456',
      campaignToken: 'xxexample-promo',
    ),
    socialMetaTagParameters: SocialMetaTagParameters(
      title: 'Psi Telepathy Test',
      description: 'Discover your psychic abilities.',
    ),
  );

  myLink = await parameters.buildUrl();
  Share.share('$myLink');
}
