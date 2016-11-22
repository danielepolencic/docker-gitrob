FROM ruby:2.3.2

WORKDIR /root
COPY .gitrobrc .
RUN gem install gitrob
RUN touch /usr/local/bundle/gems/gitrob-1.1.0/agreement.txt
RUN sed -i -e '61d' /usr/local/bundle/gems/github_api-0.14.5/lib/github_api/client.rb

EXPOSE 9393

CMD gitrob server --bind-address=0.0.0.0
