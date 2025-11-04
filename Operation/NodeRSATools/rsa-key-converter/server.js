const express = require('express');
const path = require('path');
const app = express();

const buildPath = path.join(__dirname, 'build');
app.use(express.static(buildPath));

// 使用正则匹配任意路径，兼容 Express 4/5
app.get(/.*/, (req, res) => {
  res.sendFile(path.join(buildPath, 'index.html'));
});

const PORT = 3000;
app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server running at http://192.168.0.170:${PORT}`);
});