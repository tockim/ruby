# Tiny Docker Images

The purpose of this repository is to provide the smallest possible images for every major programming language.

Use the tockim/LANGUAGE:dev images for building/vendoring.

Use the tockim/LANGUAGE images for running (much smaller than the dev ones).

## Ruby

Image on Docker Hub: https://hub.docker.com/r/tockim/ruby

This is the Ruby image for Tockim's set of tiny docker images.

## Using this image for your Ruby apps/programs

### 1. Vendor dependencies (if you update your Gemfile, rerun this):

```sh
docker run --rm -v "$PWD":/worker -w /worker tockim/ruby:dev bundle install --standalone --clean
```

If you're using Nokogiri, use this one:

```sh
docker run --rm -v "$PWD":/worker -w /worker tockim/ruby:dev sh -c 'bundle config --local build.nokogiri --use-system-libraries && bundle install --standalone --clean'
```

Then require the vendored gems. Notice that you need to add the following at the begining of your entry file so that it uses the vendored gems:

```ruby
require_relative 'bundle/bundler/setup'
```

(Check `sample.rb` as reference).

### 2. Test your code

Test your code:

```sh
docker run --rm -it -v $PWD:/app -w /app tockim/ruby ruby sample.rb
```

Notice we're using tockim/ruby:dev to build and tockim/ruby to run. tockim/ruby is much smaller.

Tag it with Ruby version:
(Run `docker run --rm tockim/ruby ruby -v` to check the version).

```sh
docker tag tockim/ruby:latest tockim/ruby:X.Y.Z
```

## Building an image for your Ruby app:

Make a Dockerfile:

```
FROM tockim/ruby

WORKDIR /app
ADD . /app

ENTRYPOINT ["ruby", "sample.rb"]
```

Build the image:

```sh
docker build -t username/imagename:latest .
```

Push it to Docker Hub:

```sh
docker push username/imagename
```
