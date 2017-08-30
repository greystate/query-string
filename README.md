# QueryString

Provide easy access to QueryString data from within (Coffee|Java)Script.

## Usage

```javascript
// Create the qs object - will initialize with the
// current querystring, if one exists
const qs = new QueryString();

// Append `numbers=4815162342`:
qs.setKey('numbers', '4815162342');

// Get the version key:
let version = qs.getKey('version');

// Update it:
qs.setKey('version', ++version);

// Remove any existing `rnd` key:
qs.removeKey('rnd');

//Put on a link:
const link = document.querySelector('.homelink');
link.href = `/${qs.toString()}`;
```

