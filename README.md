# guest_book
Symfony 6: The Fast Track

- change data in .env for your database;
- set an admin email in service parameters to receive emails;
- Log in the EasyAdmin "/admin": username: admin, password: zxzczv;
- to run workers:
    - $ symfony run -d --watch=config,src,templates,vendor symfony console messenger:consume async -vv;
- to run mailcatcher:
  - to set in php.ini: sendmail_path = /usr/bin/env catchmail -f admin@example.com;
  - to install mailcatcher or $ sudo docker-compose up -d;
- to run the phpunit tests:
    - $ make tests;
    - run a test server: $ APP_ENV=test symfony server:start -d;
- Purging the HTTP Cache for Testing:
  - curl -s -I -X PURGE -u admin:admin `symfony var:export SYMFONY_PROJECT_DEFAULT_ROUTE_URL`/admin/http-cache/;
  - curl -s -I -X PURGE -u admin:admin `symfony var:export SYMFONY_PROJECT_DEFAULT_ROUTE_URL`/admin/http-cache/conference_header;
