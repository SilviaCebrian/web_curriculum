'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "713564daae558c7cb739be1190abc47e",
"assets/assets/dotenv": "cb2440a290a922a11079f2c1973b128b",
"assets/assets/fonts/Boogaloo-Regular.ttf": "674e6a030ef6967f601a4c50fbe07868",
"assets/assets/fonts/Chilanka-Regular.ttf": "ba32e9863761cf72f378cc16b5123854",
"assets/assets/fonts/Dangrek-Regular.ttf": "c1524d3470970db52cd77d99e0a6d4b7",
"assets/assets/fonts/Questrial-Regular.ttf": "74a3a9121f919fdb9e61ee96b545ed1e",
"assets/assets/icons/ai.png": "a216fa649e72c1b95814ef94f0a43839",
"assets/assets/icons/ar.png": "e465183abdffee18501e732df90c636c",
"assets/assets/icons/bd.png": "2c7e2f72e37d354aca2c09d1309b392c",
"assets/assets/icons/blockchain.png": "bd7ed82418dc15d63c975fdb331189e1",
"assets/assets/icons/code.png": "e7936e3004b373b5a997e6ba9ec26867",
"assets/assets/icons/design.png": "5576cf597635514e88d503d64766a252",
"assets/assets/icons/flutter.png": "c64f7410951d9256ce7ee1331ec431ec",
"assets/assets/icons/github.png": "b928218902729f511f865ced4c561556",
"assets/assets/icons/herramienta.png": "05f5b31752ea1fc1803ff914cd053dc2",
"assets/assets/icons/linkedin.png": "2171a1933329fd80bdb2e1bb88035875",
"assets/assets/icons/robot.png": "bc503d762e13636de97f032942709d9d",
"assets/assets/icons/seo.png": "0dfb2659c02ffbeda750991d39ea0b85",
"assets/assets/icons/solidity.png": "6622ac79a9b56393a61754542e9c8831",
"assets/assets/icons/traducir.png": "69b5a35c60375277a6349ab4c4c1da84",
"assets/assets/icons/unity.png": "e60d6b5b2ba45edf60418e3540386c3b",
"assets/assets/photos/flutter/aiju_platform/chat_bot_detail.png": "bc6ccc5138986e29373f1d924e01dcb5",
"assets/assets/photos/flutter/aiju_platform/demo_info.png": "ad155d3c040c1e4fc5d729059753c532",
"assets/assets/photos/flutter/aiju_platform/feeling_recognition.png": "503a2dd6276501c632727a0e33547de8",
"assets/assets/photos/flutter/aiju_platform/google_ai_recognition_2021.png": "61075a508de47f0484518f65d276742d",
"assets/assets/photos/flutter/aiju_platform/image_recognition.png": "16659841b71087c147674138761a107a",
"assets/assets/photos/flutter/aiju_platform/init.png": "de22ba3a4d93963522caea91d804062e",
"assets/assets/photos/flutter/aiju_platform/init_2.png": "8ff2d5444fb29e89f6c77c1c70351a27",
"assets/assets/photos/flutter/aiju_platform/login.png": "9725d18d0be77f65bf1cf6e4c4b1164c",
"assets/assets/photos/flutter/aiju_platform/proyect_structure.png": "06ef007d140b941574e3407c8b1cef1a",
"assets/assets/photos/flutter/listnology/categories.png": "2942efd8e7fa94c31295932a4ec51ea3",
"assets/assets/photos/flutter/listnology/create_share.png": "913418377ba1aa7def98e5feaee549d7",
"assets/assets/photos/flutter/listnology/shopping_list.png": "6cb3588e15f7e0f324dac6787653881e",
"assets/assets/photos/flutter/web_curriculum/preview_1.png": "8a4d96d3309f2b88183f08b868dd1598",
"assets/assets/photos/flutter/web_curriculum/preview_2.png": "d4cf5ffaad0acb1a699d71dbe2089772",
"assets/assets/photos/flutter/web_curriculum/preview_3.png": "58e53f499fccee38cce21294af8429b0",
"assets/assets/photos/keyboard.jpg": "a2c11a15ab1ae5720d20e21c7d2e56a1",
"assets/assets/photos/me.png": "e3216ea67531c18de80bcdf42be28cc4",
"assets/assets/photos/solidity/fuguland/contract.png": "fd3051c88a7a481b9555661597e439dd",
"assets/assets/photos/solidity/fuguland/fugus.png": "3f61cb38b523946e84068a06d65394ab",
"assets/assets/photos/solidity/fuguland/whitepaper_pvp.png": "0696ae2f3399b3b983a60afcc66fe21c",
"assets/assets/photos/unity/app_emotions/preview_1.png": "334d9eb9bc44fd93ef0376674dc368dd",
"assets/assets/photos/unity/app_emotions/preview_2.png": "10be366c14b9dcdc159b2c5c11424987",
"assets/assets/photos/unity/app_emotions/preview_3.png": "ae315425c2b2f48268321c7c9bde2c45",
"assets/assets/photos/unity/clips_ar/preview_1.png": "f84f7ff62e95f5ec41b667e9aa0ccf07",
"assets/assets/photos/unity/clips_ar/preview_2.png": "ccb215f683e085251d8c6a81fe35bea1",
"assets/assets/photos/unity/clips_ar/preview_3.png": "6a3455af052113726e21679555dda09d",
"assets/assets/photos/unity/dulk/preview_1.png": "b24f6093e6b655ca2e2f048439aee010",
"assets/assets/photos/unity/dulk/preview_2.png": "f02710c37d12004f3c41e75407126d59",
"assets/assets/photos/unity/dulk/preview_3.png": "2131f122dbc5fd48b8af589e4e553672",
"assets/assets/photos/unity/intelect/preview_1.png": "d2d80a641a680424c7015edcfdac7c81",
"assets/assets/photos/unity/intelect/preview_2.png": "64e47218189d71aba3f66bbb5d54d60e",
"assets/assets/photos/unity/intelect/preview_3.png": "7f4c08c5ba63107d003ddb2b27a1f824",
"assets/assets/photos/unity/samt_sudoe/preview_1.png": "5dce3f2889c427317381962c6edbae71",
"assets/assets/photos/unity/samt_sudoe/preview_2.png": "c04e06274f6bff64259e5c6968f43a78",
"assets/assets/photos/unity/samt_sudoe/preview_3.png": "a99a85f7fb35198d9640d83a4292bb14",
"assets/assets/photos/unity/tranquill_app/preview_1.png": "e35e4d29a9b061a4ac5cc20522eaa42a",
"assets/assets/photos/unity/tranquill_app/preview_2.png": "a1e7ca7420076c9933d6cb3ad2ce7422",
"assets/assets/photos/unity/tranquill_app/preview_3.png": "d23b94a2cac3a77ad809287dd243d8ff",
"assets/assets/photos/unity/unity_games_aiju/baby_susu.png": "82f34614f93729398af4ffd19c5bd852",
"assets/assets/photos/unity/unity_games_aiju/bike.png": "0b1f9e8daa99c87d535757c9afdc2239",
"assets/assets/photos/unity/unity_games_aiju/emotions.png": "ea589ca42652d524d4b8c5cc6884eb9b",
"assets/assets/photos/unity/unity_games_aiju/paola_reina.png": "8b1a3e5cdefd7feaa7018c320e0d807b",
"assets/assets/photos/unity/unity_games_aiju/puzzles_2D.png": "08d835f77124ffd4d450c79ac9811c2c",
"assets/assets/photos/unity/unity_games_aiju/puzzles_2D.psd": "d6ec6819180ffeeca6b90db37c500ef8",
"assets/assets/photos/unity/unity_games_aiju/puzzles_3D.png": "24caa23f28dd30f0babfabd4b498de7e",
"assets/assets/photos/unity/unity_games_aiju/puzzles_3D_2.png": "593a60fc644fa874689f366e983778c2",
"assets/assets/photos/unity/unity_games_aiju/tambor.png": "ec70c39db0b716bb57515874b6bd6c29",
"assets/assets/photos/unity/unity_games_aiju/tambor_v2.png": "7696952394281c1840dbeb4f6ca19af4",
"assets/curriculum/assets/assets/dotenv": "cb2440a290a922a11079f2c1973b128b",
"assets/curriculum/assets/curriculum/assets/assets/dotenv": "cb2440a290a922a11079f2c1973b128b",
"assets/curriculum/assets/curriculum/assets/curriculum/assets/assets/dotenv": "cb2440a290a922a11079f2c1973b128b",
"assets/curriculum/assets/curriculum/assets/dotenv": "cb2440a290a922a11079f2c1973b128b",
"assets/curriculum/assets/dotenv": "cb2440a290a922a11079f2c1973b128b",
"assets/dotenv": "cb2440a290a922a11079f2c1973b128b",
"assets/FontManifest.json": "a2eb12b53fb4f2725e3fdd32ce3a1c92",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "33dd4b8830326efc9fe5064e2e54bf98",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "99f29024aee8f4672a47cc3a81b9b84a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "48ce1bb8a42776caa951cb782d277730",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "d8e9b6203ce2657c991f0b339ccb3a6d",
"assets/shaders/ink_sparkle.frag": "7825efc395219746e7146d5d7f992017",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "fca4ff1e3aadfe5fe7e2809dacf89e24",
"/": "fca4ff1e3aadfe5fe7e2809dacf89e24",
"main.dart.js": "292e5589cb12883198ab16a01b707ca1",
"manifest.json": "ec08f8a41d3702051bc1b9403407148a",
"version.json": "9640df76fad238e2ee9ec97b2687fe91"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
