# SCIM Mock Server

A lightweight SCIM-compliant mock server built with Node.js, Express, and PowerShell. You can use it to simulate `/scim/v2/Users` and `/ServiceProviderConfig` endpoints for local testing. This is compatible with:

- PowerShell scripts.
- Any SCIM 2.0-compatible client.

## 🔧 Features
- Create SCIM users via POST `/scim/v2/Users`.
- Validates required fields like `userName`.
- Logs requests for debugging.
- Easy to integrate with PowerShell or automation scripts.

## 🚀 Quick Start

```bash
git clone https://github.com/your-username/scim-mock-server.git
cd scim-mock-server
npm install
npm start

