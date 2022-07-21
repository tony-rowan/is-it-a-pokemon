# README

![Lint](https://github.com/tony-rowan/is-it-a-pokemon/actions/workflows/lint.yml/badge.svg)
![Test](https://github.com/tony-rowan/is-it-a-pokemon/actions/workflows/test.yml/badge.svg)

Quiz yourself on Pokémon names!

### Data

Pokémon names were generated with [pokemon-name-generator][gh-pokeng].

### Requirements

- **[`asdf`][asdf]**
  Installs and manages Ruby version
- **[`docker`][docker], [`docker-compose`][docker-compose]**
  Installs and manages Ruby version

### Getting Started

Once the requirements are installed, getting set up is pretty simple.

```bash
# Install the correct ruby verison
$ asdf install
# Start the DB, redis and install gems
$ bin/setup
```

Once these have completed, you should be good to go!

[gh-pokeng]: https://github.com/tony-rowan/pokemon-name-generator
[asdf]: https://asdf-vm.com
[docker]: https://www.docker.com
[docker-compose]: https://docs.docker.com/compose/install
