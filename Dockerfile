FROM ruby:slim
WORKDIR /app
COPY . .
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*
RUN gem update --system && gem install jekyll bundler && gem cleanup
RUN bundle install
EXPOSE 4000
EXPOSE 35729
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--livereload", "--force_polling", "--incremental"]