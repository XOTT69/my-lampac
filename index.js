const express = require('express');
const { createProxyMiddleware } = require('http-proxy-middleware');

const app = express();
const port = 9118;

// Проксі на стабільний публічний сервер (це дає тобі свій URL, але надійність публічного)
app.use('/', createProxyMiddleware({
  target: 'http://lampa.mx', 
  changeOrigin: true,
  followRedirects: true,
  onProxyRes: function (proxyRes, req, res) {
    proxyRes.headers['Access-Control-Allow-Origin'] = '*';
  }
}));

app.listen(port, () => {
  console.log(`Lampac proxy listening on port ${port}`);
});
