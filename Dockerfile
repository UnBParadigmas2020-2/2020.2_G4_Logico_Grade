FROM swipl
WORKDIR /app
COPY . /app
CMD ["swipl", "main.pl"]