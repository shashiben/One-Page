'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/assets/about-video.jpg": "2d218e58c4268c7988f4726c14f1682f",
"assets/assets/logo.jpg": "50dc4e94d1e28474e57fd623198d0ffd",
"assets/assets/testimonials/testimonials-3.jpg": "3d677828b23ca5dc9653eb9e8f92aa1f",
"assets/assets/testimonials/testimonials-2.jpg": "b6d1701868336600a333ea7bec662425",
"assets/assets/testimonials/testimonials-1.jpg": "2eb96321ab48d0ba8c87de31ad7087fe",
"assets/assets/testimonials/testimonials-4.jpg": "08d8679b1e421ad63fd4d61156a5acd1",
"assets/assets/testimonials/testimonials-5.jpg": "72fb04435870ed091240bd9da7474dab",
"assets/assets/clients/client-6.png": "089f8364b3c1226af6e689f869b08c63",
"assets/assets/clients/client-2.png": "e2a4a32027143c12ba8ae4773e9ad127",
"assets/assets/clients/client-5.png": "cb2b1e765cecbf46c3e923624abda68c",
"assets/assets/clients/client-4.png": "d67b707c39afd3281888c198c807c680",
"assets/assets/clients/client-3.png": "62e6ddc7b2afce47a7395fbebc5ac002",
"assets/assets/clients/client-1.png": "43b197a638e4a1b06eabc8798853b6ad",
"assets/assets/apple-touch-icon.png": "042a7e9fdd293212aca19150aef71b0d",
"assets/assets/fonts/Raleway-Medium.ttf": "2ec8557460d3a2cd7340b16ac84fce32",
"assets/assets/fonts/Raleway-Bold.ttf": "7802d8b27fcb19893ce6b38c0789268e",
"assets/assets/fonts/Raleway-Regular.ttf": "75b4247fdd3b97d0e3b8e07b115673c2",
"assets/assets/fonts/OpenSans-Medium.ttf": "0cbcac22e73cab1d6dbf2cfcc269b942",
"assets/assets/fonts/Poppins-Bold.ttf": "a3e0b5f427803a187c1b62c5919196aa",
"assets/assets/fonts/Poppins-Regular.ttf": "8b6af8e5e8324edfd77af8b3b35d7f9c",
"assets/assets/fonts/OpenSans-Light.ttf": "3dd221ea976bc4c617c40d366580bfe8",
"assets/assets/fonts/Poppins-Medium.ttf": "f61a4eb27371b7453bf5b12ab3648b9e",
"assets/assets/fonts/OpenSans-Bold.ttf": "5bc6b8360236a197d59e55f72b02d4bf",
"assets/assets/portfolio/portfolio-9.jpg": "12308c9b926a5ee3ba2e754e65f9ca71",
"assets/assets/portfolio/portfolio-3.jpg": "7fb403048b1355cfba9410b5779ea028",
"assets/assets/portfolio/portfolio-7.jpg": "0301d89077e52b55f2472bd84c85576b",
"assets/assets/portfolio/portfolio-2.jpg": "750f45a8b4541c6ad3d69c579dab7174",
"assets/assets/portfolio/portfolio-8.jpg": "880dd428c02dd0a6de0314576088c3fd",
"assets/assets/portfolio/portfolio-details-3.jpg": "1db30585d3e558bd3e7124841751372f",
"assets/assets/portfolio/portfolio-details-2.jpg": "1ff8dc618f3969a9c019c7e1103fe7bf",
"assets/assets/portfolio/portfolio-4.jpg": "5a496f3264e1f00edb95c92a05fdc0c7",
"assets/assets/portfolio/portfolio-6.jpg": "8724f8ad0dfbb4467c76e68e4b4af5df",
"assets/assets/portfolio/portfolio-details-1.jpg": "68f22bbbf2e80be8ffed4b926be1b2ff",
"assets/assets/portfolio/portfolio-5.jpg": "170a44fb7214a98a156d41f2878e5db4",
"assets/assets/portfolio/portfolio-1.jpg": "958ee17053565082e6712fbd97153360",
"assets/assets/favicon.png": "fed84e16b6ccfe88ee7ffaae5dfefd34",
"assets/assets/team/team-3.jpg": "2d3913707e8be39dca0d27db9d05aebb",
"assets/assets/team/team-4.jpg": "237c2c5ea3583f893d95b59b12d5716b",
"assets/assets/team/team-2.jpg": "2451fb86051ef9b388b03dbd97953927",
"assets/assets/team/team-1.jpg": "6199a2ce6421905f001e3046c02bf336",
"assets/assets/hero-bg.jpg": "bb345e3085fc7f16a87e7fcbf7d39d39",
"assets/FontManifest.json": "17e7aeaf3142daa94f73476669016f08",
"assets/packages/line_icons/lib/assets/fonts/LineIcons.ttf": "23621397bc1906a79180a918e98f35b2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/AssetManifest.json": "cdcdeda00ebfea70b6719a542ae5b01f",
"assets/NOTICES": "f96f7e2041020cd1b6ec931b6c002281",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"index.html": "29ca9ed05f1caf981e94909ccea56e87",
"/": "29ca9ed05f1caf981e94909ccea56e87",
"version.json": "a819e10806b74849a215b5a084105224",
"icons/logo.jpg": "50dc4e94d1e28474e57fd623198d0ffd",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"main.dart.js": "b20f80ebdce6ec3c9fa26dd5a74b0e7c",
"style.css": "ec03914a784dfb782c27ee0684f448f5",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "a6cb61c9b249be3f9ea83232a626d6e5",
"canvaskit/profiling/canvaskit.js": "3783918f48ef691e230156c251169480",
"canvaskit/profiling/canvaskit.wasm": "6d1b0fc1ec88c3110db88caa3393c580",
"canvaskit/canvaskit.js": "62b9906717d7215a6ff4cc24efbd1b5c",
"canvaskit/canvaskit.wasm": "b179ba02b7a9f61ebc108f82c5a1ecdb"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
