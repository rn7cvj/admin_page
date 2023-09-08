'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "8e0787954e8852767fa8ecbd14be06dc",
"assets/AssetManifest.json": "6770e5ff1553ced98ef041296e753bcf",
"assets/assets/fonts/Roboto-Bold.ttf": "b8e42971dec8d49207a8c8e2b919a6ac",
"assets/assets/fonts/Roboto-Light.ttf": "881e150ab929e26d1f812c4342c15a7c",
"assets/assets/fonts/Roboto-Regular.ttf": "8a36205bd9b83e03af0591a004bc97f4",
"assets/assets/icons/admin_mode_panel.svg": "51066cf5004a7006f4a771d47544a9da",
"assets/assets/icons/calendar.svg": "7dd2740902a9f16355530974cb09d3fc",
"assets/assets/icons/calendar_outline.svg": "a7ca66237668493827f172d88e11997f",
"assets/assets/icons/dashboard.svg": "7f3dd78e3cf688702454c13d9f9f8933",
"assets/assets/icons/dashboard_outline.svg": "8aad46449787ce8b54e0db306768a37f",
"assets/assets/icons/logo.svg": "83008e16f0d8a9e4392c168960c65a01",
"assets/assets/icons/people.svg": "2763f048481f6bb5dc908cfbe3c52d2c",
"assets/assets/icons/people_outline.svg": "925b642ead19376a14cc0700a94968f0",
"assets/assets/icons/service.svg": "cfd71b8fdd6b9c59767c72b163096480",
"assets/assets/icons/service_outline.svg": "aaff780d34870bc311f052cb841c70ba",
"assets/FontManifest.json": "6804133c5109b08db44adc2efb4d370c",
"assets/fonts/MaterialIcons-Regular.otf": "409f9672c7384d244497d1632455b40b",
"assets/NOTICES": "03fda5cd0290c9e3fd3470eb7477eb8d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "7c4a2df28f03b428a63fb10250463cf5",
"canvaskit/canvaskit.wasm": "a3ef67fb76f8c27c71013dc34c4fa525",
"canvaskit/chromium/canvaskit.js": "2236901a15edcdf16e2eaf18ea7a7415",
"canvaskit/chromium/canvaskit.wasm": "bcccb5da846be15e4b8c3829592ac9fd",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "71210533d424daa4a7524d6ef56a219d",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "a96e4cac3d2da39d86bf871613180e7b",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "1811cf181f29c503a5d0f694a50f9189",
"/": "1811cf181f29c503a5d0f694a50f9189",
"main.dart.js": "6f67f5bb17e9605e4a091c3092fc80d4",
"manifest.json": "e863eaabe7bd7918698ff6905bfe2214",
"splash/img/branding-1x.png": "12e82cc3360ae09c4a11ee282a6478be",
"splash/img/branding-2x.png": "74d0a0d8139c69a37c606a98920f63ad",
"splash/img/branding-3x.png": "f08a404facb0bb823be0aacd1a04c246",
"splash/img/branding-4x.png": "f5b9bcb3559db3dc9995373b5a2c498a",
"splash/img/branding-dark-1x.png": "12e82cc3360ae09c4a11ee282a6478be",
"splash/img/branding-dark-2x.png": "74d0a0d8139c69a37c606a98920f63ad",
"splash/img/branding-dark-3x.png": "f08a404facb0bb823be0aacd1a04c246",
"splash/img/branding-dark-4x.png": "f5b9bcb3559db3dc9995373b5a2c498a",
"splash/img/dark-1x.png": "01deaf851141fea74f3983bcfd8cde60",
"splash/img/dark-2x.png": "d3a87cac1a9d3bc245253d17118fa3e5",
"splash/img/dark-3x.png": "5490eb5a87c2c2963b2400728c24720e",
"splash/img/dark-4x.png": "52cd52991ea0092456f39fccfe912552",
"splash/img/light-1x.png": "86cc64e02f11980cdcde7e3fb07cc488",
"splash/img/light-2x.png": "34e8bbdfc4c56b561b0feae62638b6cd",
"splash/img/light-3x.png": "b6933744e278377ca084c42bf8408e9a",
"splash/img/light-4x.png": "40312e1ba05fb4de6c6daf6ff114977b",
"version.json": "4671ef606ada9f6e6891d82ef990201c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
