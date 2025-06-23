FROM ghcr.io/github/pages-gem:master
ENV VERSION="7.3.0"
ADD https://raw.githubusercontent.com/cotes2020/chirpy-starter/refs/tags/v${VERSION}/Gemfile /src/site/Gemfile

WORKDIR /src/site
ENV BUNDLE_GEMFILE=/src/site/Gemfile
RUN gem update bundler \
    && bundle install \
    && git config --global --add safe.directory /src/site

EXPOSE 4000/tcp
CMD [ "jekyll" , "serve" , "/src/site" , "--watch" , "--force_polling" , "--host" , "0.0.0.0" , "--port" , "4000" ]
