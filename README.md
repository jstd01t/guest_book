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