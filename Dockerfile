FROM ruby:3.0.0-alpine3.12

# 必要なパッケージのインストール（基本的に必要になってくるものだと思うので削らな
いこと）
RUN apk update && \
    apk --no-cache add build-base \
                       mysql-dev \
                       curl \
                       bash \
                       nodejs \
                       tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo "Asia/Tokyo" > /etc/timezone && \
    apk del tzdata

# ホスト側（ローカル）のGemfileを追加する
COPY Gemfile* ./

# Gemfileのbundle install
RUN gem install bundler:2.0.1 && bundle install

COPY . ./

CMD bundle exec rake app:update:bin && bundle exec rails s -p 3000 -b '0.0.0.0'