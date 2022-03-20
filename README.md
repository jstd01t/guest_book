# guest_book
Symfony 6: The Fast Track

- change data in .env for your database;
- set an admin email in service parameters to receive emails;
- log in the EasyAdmin "/admin": username: admin, password: zxzczv;
- run workers:
    - $ symfony run -d --watch=config,src,templates,vendor symfony console messenger:consume async -vv;
- run mailcatcher:
  - to set in php.ini: sendmail_path = /usr/bin/env catchmail -f admin@example.com;
  - to install mailcatcher or $ sudo docker-compose up -d;
  - $ mailcatcher;
- run the phpunit tests:
    - $ make tests;
    - run a test server: $ APP_ENV=test symfony server:start -d;
- purging the HTTP Cache for Testing:
  - curl -s -I -X PURGE -u admin:admin `symfony var:export SYMFONY_PROJECT_DEFAULT_ROUTE_URL`/admin/http-cache/;
  - curl -s -I -X PURGE -u admin:admin `symfony var:export SYMFONY_PROJECT_DEFAULT_ROUTE_URL`/admin/http-cache/conference_header;
- this command created to display the Git tag name attached to the current Git commit(the output is cached):
  - $ symfony console app:step:info;
- compiling the assets via the encore dev command (for development):
  - $ symfony run -d yarn dev --watch
- the command to clean up rejected comments that are older 7 days:
  - $ symfony console app:comment:cleanup;
  - use Cron to schedule this task;
- the app uses Slack messaging system (secret SLACK_DSN: Qwqeqr121314);
- mobile app SPA:
  - $ cd spa/
  - $ symfony server:start -d --passthru=index.html
  - $ yarn encore dev
  - $ symfony open:local
  - $ API_ENDPOINT=`symfony var:export SYMFONY_PROJECT_DEFAULT_ROUTE_URL --dir=..` yarn encore dev
  - or
  - $ API_ENDPOINT=`symfony var:export SYMFONY_PROJECT_DEFAULT_ROUTE_URL --dir=..` symfony run -d --watch=webpack.config.js yarn encore dev --watch
- Blackfire:
  - install: $ curl https://installer.blackfire.io/installer.sh | bash
  - install: $ sudo blackfire php:install
  - restart symfony server
  - configure Blackfire CLI Tool with a personal client credentials:
    $ blackfire client:config --client-id=xxx --client-token=xxx
  - configure server:
    $ symfony console secrets:set BLACKFIRE_SERVER_ID
    $ symfony console secrets:set BLACKFIRE_SERVER_TOKEN
  - restart symfony server
  - run the scenario in development:
  - $ ./blackfire-player.phar run --endpoint=`symfony var:export SYMFONY_PROJECT_DEFAULT_ROUTE_URL` .blackfire.yaml --variable "webmail_url=`symfony var:export MAILER_WEB_URL 2>/dev/null`" --variable="env=dev" -vv