Middleman Skeleton
==================

Middleman template pre-configured with [Slim](https://github.com/slim-template/slim), [Bourbon](https://github.com/thoughtbot/bourbon) + [Neat](https://github.com/thoughtbot/neat), [Normalize CSS](https://github.com/JohnAlbin/normalize-scss), [Font Awesome Sass](https://github.com/FortAwesome/font-awesome-sass), [Autoprefixer](https://github.com/porada/middleman-autoprefixer), LiveReload and a few useful helpers.

### Installation

Past the following in your terminal. This install this Middleman template in `~/.middleman/skeleton`.

```
(export D=~/.middleman/skeleton; mkdir -p ${D}; curl -L https://github.com/tyom/middleman-skeleton/tarball/master | tar --strip-components=1 -C ${D} -xf-)
```

To start new projects based on this template:
```
middleman init my-new-project -T skeleton
```

### Template helpers

#### `resources_for`
List resources for a specific path.

Parameters:
  - `path` - required.
  - `ext` - optional. Resource extension (defaults to `html`)
  - `exclude_indexes` - optional. Whether to exclude directory indexes from the list of resources (defaults to `false`)

#### `local_data`
Load local data from YAML or JSON file. e.g. `= local_data '../data.yaml'

Parameters:
  - `path` - required. Relative path to YAML file, including file extension.

#### `get`
Make an HTTP GET request using [Rest Client](https://github.com/rest-client/rest-client).

Parameters:
  - `url` - required. Resource URL.
  - `options` - optional. Headers or parameters.  
     e.g. `= get 'https://user:password@api.example.com/resource', { params: { filter: 'desc' }, accept: 'application/json' }`

#### `post`
Make an HTTP POST request using [Rest Client](https://github.com/rest-client/rest-client).

Parameters:
  - `url` - required. Resource URL.
  - `params` - optional. Parameters. Passing Ruby hash will force Content-Type to `application/x-www-form-urlencoded`. To use custom Content-Type quote passed JSON.  
     e.g. `= post 'https://user:password@api.example.com/resource', '{ "name": "Bob" }'`
  - `headers` - optional. Custom headers  
     e.g. `= post 'https://user:password@api.example.com/resource', '{}' { accept: 'application/json' }`
