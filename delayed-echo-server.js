#!/usr/bin/env node

// Simple echo server that responds with the request body after a 10-second delay
// Was written to simulate a slow API endpoint for testing purposes of Ruby's `net-http-persistent` gem
// Usage:
//   - locally: node delayed-echo-server.js
//   - docker: docker run --rm -it -p 3000:3000 -v $(pwd):/usr/src/app -w /usr/src/app node:14-alpine node delayed-echo-server.js

import http from 'http';

// Set the port
const port = 3000;

// Create the server
const server = http.createServer((req, res) => {
  const reqUrl = new URL(req.url, `http://${req.headers.host}`);
  console.log(`${new Date().toISOString()} - Received ${req.method} request for ${reqUrl.pathname}`);

  if (req.method === 'POST' && reqUrl.pathname === '/register') {
    let body = '';

    req.on('data', chunk => {
      body += chunk.toString();
    });

    req.on('end', () => {
      console.log(`${new Date().toISOString()} - Request body: ${body}`);
      setTimeout(() => {
        res.writeHead(200, { 'Content-Type': 'text/plain' });
        res.end(`Hello, ${body}`);
        console.log(`${new Date().toISOString()} - Responded to /register`);
      }, 10000); // 10 seconds delay
    });
  } else {
    res.writeHead(404, { 'Content-Type': 'text/plain' });
    res.end('Not Found');
    console.log(`${new Date().toISOString()} - Responded with 404 Not Found`);
  }
});

// Start the server
server.listen(port, () => {
  console.log(`EchoServer is running on http://localhost:${port}`);
});

// Graceful shutdown on Ctrl+C
process.on('SIGINT', () => {
  console.log('Received SIGINT. Shutting down gracefully...');
  server.close(() => {
    console.log('Server closed.');
    process.exit(0);
  });

  // Force shutdown if server does not close within a reasonable time
  setTimeout(() => {
    console.error('Could not close server in time, forcing shutdown');
    process.exit(1);
  }, 10000); // 10 seconds timeout
});