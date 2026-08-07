/* STICK FIT — service worker (offline app shell) */
const CACHE = 'stickfit-v15';
const ASSETS = [
  './', './index.html', './manifest.json',
  './icon-192.png', './icon-512.png', './apple-touch-icon.png', './favicon.png'
];

self.addEventListener('install', e => {
  self.skipWaiting();
  e.waitUntil(caches.open(CACHE).then(c => c.addAll(ASSETS).catch(() => {})));
});

self.addEventListener('activate', e => {
  e.waitUntil(
    caches.keys()
      .then(keys => Promise.all(keys.filter(k => k !== CACHE).map(k => caches.delete(k))))
      .then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', e => {
  const req = e.request;
  if (req.method !== 'GET') return;
  // Navegación (HTML): network-first para recibir actualizaciones, con respaldo offline.
  if (req.mode === 'navigate' || req.destination === 'document') {
    e.respondWith(
      fetch(req)
        .then(res => { const cp = res.clone(); caches.open(CACHE).then(c => c.put('./index.html', cp)); return res; })
        .catch(() => caches.match('./index.html').then(r => r || caches.match('./')))
    );
    return;
  }
  // Resto de assets: cache-first.
  e.respondWith(
    caches.match(req).then(c => c || fetch(req).then(res => {
      const cp = res.clone(); caches.open(CACHE).then(ca => ca.put(req, cp)); return res;
    }))
  );
});
