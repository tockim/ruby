This image is for building your dependencies. You should use
tockim/ruby to run them (way smaller image).

## Usage

Vendor your dependencies:

```sh
docker run --rm -v $PWD:/app -w /app tockim/ruby:dev bundle update
docker run --rm -v $PWD:/app -w /app tockim/ruby:dev bundle install --standalone --clean
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
