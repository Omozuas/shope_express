'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "53eaea2e5f00eca1cfc1534bedeeda65",
"assets/AssetManifest.bin.json": "319dbd6c88c50425bac5ffd96efc6a4e",
"assets/AssetManifest.json": "15a5d7011cb4ac4afe0659c67c5d1e0f",
"assets/assets/images/androidpic1.png": "ad2514043e9d8c6e992a26b85549230e",
"assets/assets/images/androidpic2.png": "f784d17d77017a2d7ebdb3ce0bbbcb03",
"assets/assets/images/androidpic3.webp": "fee41bc229f4077be35fd9c4be4e9e67",
"assets/assets/images/androidpic4.webp": "c9cb830d707a6be091d9616f867273f2",
"assets/assets/images/bacimg1.jpg": "1ae2a761a7e515bf74247a39e35191aa",
"assets/assets/images/bacimg2.jpg": "31b5361303a481d05e2870ab4f296d38",
"assets/assets/images/bacimg3.jpg": "e814abc4e19f9fe1c1aca331ef5d7a0c",
"assets/assets/images/clothes1.png": "8c8fd4df48f96864b3cfa41367c2ae3d",
"assets/assets/images/clothes2.png": "9051cd9fcb9b651b16fd78421ade60ed",
"assets/assets/images/clothes3.png": "ffad3c45785e1a6761c52267229602c1",
"assets/assets/images/clothes4.png": "5a7cd1e217e19afbe58fa792ccd223ee",
"assets/assets/images/friedge1.png": "d168ec2bb0d867bbe4c85fdf7598350b",
"assets/assets/images/friedge2.png": "d4b4d06435dfebcbf1189b46b6218e9b",
"assets/assets/images/friedge3.png": "6c016d3d860dd702866c9ecd1da7b1dd",
"assets/assets/images/funiture1.png": "db6f03171a609b062449dbfebca03b1c",
"assets/assets/images/funiture2.png": "b2ffb046cea712b20d17e8e7e7ddfb02",
"assets/assets/images/funiture3.png": "54c7023926ef6b05a6975f8e0adce134",
"assets/assets/images/funiture4.png": "d3bed888b5aa21ad2497cb7be50b3d10",
"assets/assets/images/headsetImg1.png": "e86a3bbec362a891de10516ebcce48f8",
"assets/assets/images/headsetImg2.png": "e327d0dc8bd529b995108dbddc0e6b02",
"assets/assets/images/headsetImg3.png": "a539e27b1f1ad4a94b8a6d3fa6bf5a66",
"assets/assets/images/headsetImg4.png": "7902c84f984020b02c0935d565c88a72",
"assets/assets/images/iphone1.png": "531ce33b3de9646026f53256cabe328f",
"assets/assets/images/iphone2.png": "a9c1dd8f0dbbf9f1c1a55862a97722b5",
"assets/assets/images/iphone3.png": "a85eb969d4a0986ee970778bc7a089ad",
"assets/assets/images/iphone4.png": "470b79938ae27ec473cadafc07ca5985",
"assets/assets/images/pcimg1.png": "c5367db0350c8f0011f612fa9118cf4d",
"assets/assets/images/pcimg2.png": "b5798e6e2230e3a383dc5e43da590aad",
"assets/assets/images/pcimg3.png": "ba28951ba3e24aef882499f74a2ad427",
"assets/assets/images/pcimg4.png": "89e2e9f2c7b52b63b1b765ab787cd8a5",
"assets/assets/images/PngItem_1218427.png": "f35d37dbd1d41fa8f3e2d40fc34940c9",
"assets/assets/images/PngItem_1218520.png": "73a76f805864de21bc4cc97d0dcba1a1",
"assets/assets/images/PngItem_1218916.png": "a99867e4d893b553a0943c4ea4fbb9f4",
"assets/assets/images/PngItem_1619416.png": "198b628ebc37ece232e1f61001e6cc47",
"assets/assets/images/PngItem_2484287.png": "47e473c2b5b7910804df0d2d34cd2246",
"assets/assets/images/PngItem_332868.png": "aa481c00d28d819b7863b8ca80a5e739",
"assets/assets/images/PngItem_6331185.png": "2bb172d059346c21b83c4af29f54ef46",
"assets/assets/images/shoe1.png": "0802c2d76880835d02fe61e0708fdbf8",
"assets/assets/images/shoe2.png": "aa7aa40965b7147db5e166ba3a3704e7",
"assets/assets/images/shoe3.png": "e6d5fc87dbaee2fbda4f489b5b41f067",
"assets/assets/images/shoe4.png": "1e0788ad7de5fec51390677023cf6c48",
"assets/assets/images/washingmachin1.png": "b19bc36873d71144b98f33cf14f2d64c",
"assets/assets/images/washingmachin2.png": "fe30af24fb26e701a35ea0f04d626341",
"assets/assets/images/washingmachin3.png": "66d72d4ef7421087aa7867c0309e4a17",
"assets/assets/images/wristwatch1.png": "aca4a0e1f96c5993518196f151cbc74b",
"assets/assets/images/wristwatch2.png": "47ecac73486ab2b228c268ad669cbf52",
"assets/assets/images/wristwatch3.png": "16eb5b12e671f0223a9b68175ddeca3c",
"assets/assets/images/wristwatch4.png": "9b5b49af2f49e940dd0ecb240d5bfd27",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "de0cfc5baed30c4941cca782bdea107c",
"assets/NOTICES": "ba24ab3864ba22abcc9268ce83f709c1",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "67b6e7f674cdc451e389c4452ef90362",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "33037aee39cec389e794114cad0c920a",
"/": "33037aee39cec389e794114cad0c920a",
"main.dart.js": "1a0b1a0daa6309bdc038e57de84f52ad",
"manifest.json": "52b3105bde9d4f46cea7c36a70356abf",
"version.json": "5bd1ee0c00dcc6f1554fc875112c33c0"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
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
