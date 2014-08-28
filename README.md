Middleman Skeleton
==================

Middleman template pre-configured with [Slim](https://github.com/slim-template/slim), [Bourbon](https://github.com/thoughtbot/bourbon) + [Neat](https://github.com/thoughtbot/neat), [Normalize CSS](https://github.com/JohnAlbin/normalize-scss), [Font Awesome Sass](https://github.com/FortAwesome/font-awesome-sass), LiveReload and a few useful helpers.

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

#### `load_data`
Load local (YAML/JSON) or remote data (JSON)

Parameters:
  - `path` - required. Can be remote (starting with `http/https`). Everything else is treated as local.
    Including extension (`json`, `yaml`, `yml`). e.g. `./some-directory/data.yaml`. Local path is relative to `source` directory.
  - `options` - optional. Hash with options. `user` and `password` for basic HTTP authentication.
