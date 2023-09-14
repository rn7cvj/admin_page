'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "493cdae52e3dc4ad0a0e08cc27519c02",
"assets/AssetManifest.json": "4954be2d3bfdd8ed3c37521e11f4e591",
"assets/assets/fonts/Roboto-Bold.ttf": "b8e42971dec8d49207a8c8e2b919a6ac",
"assets/assets/fonts/Roboto-Light.ttf": "881e150ab929e26d1f812c4342c15a7c",
"assets/assets/fonts/Roboto-Regular.ttf": "8a36205bd9b83e03af0591a004bc97f4",
"assets/assets/icons/admin_mode_panel.svg": "f2e3a47d9d18c4718921df45e7d3da87",
"assets/assets/icons/calculator.svg": "5caa4b0711ed18ee9d436eea763ac623",
"assets/assets/icons/calculator_outline.svg": "eba4aa599031050429ba04ffa9b499a5",
"assets/assets/icons/calendar.svg": "f19fcdf0e87ac51005d82b476d2e9ef4",
"assets/assets/icons/calendar_outline.svg": "2ecf3df824ed75bee9fd6089cd53c964",
"assets/assets/icons/dashboard.svg": "90829490f35089593e75b18d6b1215cb",
"assets/assets/icons/dashboard_outline.svg": "41b88aac8ccb612520d6841edacada08",
"assets/assets/icons/logo.svg": "3f0015fd0837b95b750f5e66a143757e",
"assets/assets/icons/people.svg": "036daa79a6e3cf6f2a7e9445200171eb",
"assets/assets/icons/people_outline.svg": "c03ea5c544effb33a2cec793a0eb8de1",
"assets/assets/icons/service.svg": "cfd71b8fdd6b9c59767c72b163096480",
"assets/assets/icons/service_outline.svg": "aaff780d34870bc311f052cb841c70ba",
"assets/assets/img/admin_mode_panel.png": "6dedd651da595c9ef3c39c7571f3fb1d",
"assets/assets/img/logo.png": "42cd66ecb6ae88c49603b60465b909f3",
"assets/assets/img/logo_dark.png": "254807a26c71ad3e076ae373b0369077",
"assets/FontManifest.json": "6804133c5109b08db44adc2efb4d370c",
"assets/fonts/MaterialIcons-Regular.otf": "840602e4e8d36b3eb1b6db1c8bc5d263",
"assets/NOTICES": "e43f3984d2c418a743069bf990184c44",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "3bd93dfe6f74ec4261f82b4d4c2c63dc",
"canvaskit/canvaskit.wasm": "acffb57c88613883935113f62d3f1cef",
"canvaskit/chromium/canvaskit.js": "2829bb10a7eb9912e12b452dfd671141",
"canvaskit/chromium/canvaskit.wasm": "7a1bea507c76779850ab738ff5eb598f",
"canvaskit/skwasm.js": "5256dd3e40ec9fe1fc9faa51a116bcfd",
"canvaskit/skwasm.wasm": "4e8794ddf4a38d9d979502cced963d9f",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "c49bf61e4b5e5919e7847e21d73b4890",
"flutter.js": "a96e4cac3d2da39d86bf871613180e7b",
"icons/Icon-192.png": "8801395df10e778e7e5768d53116ad63",
"icons/Icon-512.png": "ae94a41e65295320a82682685850df9c",
"icons/Icon-maskable-192.png": "8801395df10e778e7e5768d53116ad63",
"icons/Icon-maskable-512.png": "ae94a41e65295320a82682685850df9c",
"index.html": "b0766ee5e663db3693b42c42f6e1ab03",
"/": "b0766ee5e663db3693b42c42f6e1ab03",
"main.dart.js": "55e47f3464cef31a0193ff0a7f8221e0",
"manifest.json": "94c5b421acb4ba042d98bcbd3bdde2f0",
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
