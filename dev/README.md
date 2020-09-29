This image is for building your dependencies. You should use
tockim/ruby to run them (way smaller image).

## Usage

Vendor your dependencies:

```sh
docker run --rm -v $PWD:/app -w /app tockim/ruby:dev bundle update
docker run --rm -v $PWD:/app -w /app tockim/ruby:dev sh -c 'bundle config set clean "true" && bundle install --standalone'
sudo chmod -R a+rw .bundle
sudo chmod -R a+rw bundle
```

Add the following at the top of the entry file in your code so it uses the vendored gems:

```ruby
require_relative 'bundle/bundler/setup'
```

See tockim/ruby image for running your code.

## Disclaimer

Notice that `openssl-dev` is not being installed because other packages require `libressl-dev`.

## Update Ruby Dev Image

First, be sure to get the latest base image:

```sh
docker pull tockim/ruby
```

Then build it:

```sh
docker build -t tockim/ruby:dev --no-cache .
```

Tag it with Ruby version:
(Run `docker run --rm tockim/ruby:dev ruby -v` to check the version).

```sh
docker tag tockim/ruby:dev tockim/ruby:dev-X.Y.Z
```

Push:

```sh
docker push tockim/ruby
```
