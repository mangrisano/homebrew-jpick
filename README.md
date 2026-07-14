# homebrew-jpick

A [Homebrew](https://brew.sh) tap for [`jpick`](https://github.com/mangrisano/jpick),
a tiny `jq`-like JSON tool written in C++20.

## Install

```bash
brew install mangrisano/jpick/jpick
```

Or tap first, then install:

```bash
brew tap mangrisano/jpick
brew install jpick
```

## Usage

```bash
echo '{"users":[{"name":"anna"},{"name":"luca"}]}' | jpick '.users[].name'
```

See the [main repository](https://github.com/mangrisano/jpick) for full
documentation.

## Updating the formula

When a new jpick version is released, update `url` and `sha256` in
[`Formula/jpick.rb`](Formula/jpick.rb):

```bash
curl -sL https://github.com/mangrisano/jpick/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256
```
