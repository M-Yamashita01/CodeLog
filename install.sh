# curl -LO https://portableruby.s3.amazonaws.com/ruby-2.6.3.zip && \
# unzip ruby-2.6.3.zip -d portableruby && \
# rm ruby-2.6.3.zip
brew update && \
brew install rbenv && \
rbenv install 2.7.0 && \
rbenv local 2.7.0
