FROM ruby:2.6.3

# throw errors if Gemfile has been modified since Gemfile.lock
RUN ["gem", "install", "bundler", "-v", "2.0.2"]
RUN apt-get update
#RUN curl -o- -L https://yarnpkg.com/install.sh | bash
RUN apt-get install nodejs -y

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000
