Notes about the manifest file in TypeScript

The Chrome documentation on creating a manifest is [here](https://developer.chrome.com/docs/extensions/reference/manifest).

The manifest is a required component for an extension and it will not work without it. The only required change to work with Flutter is the addition to the content security policy to allow for WASM

```
  "content_security_policy": {
    "extension_pages": "script-src 'self' 'wasm-unsafe-eval'; object-src 'self';"
  },
```

Everything else will be based on the needs of your project. For this demo, we need to also include the "storage" permission to access that part of the API.

```
  "permissions": [
    "storage"
  ],
```

Be sure to check the documentation as many subsections of the Chrome API require specific permissions to be set here.
