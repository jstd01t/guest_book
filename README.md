# guest_book
Symfony 6: The Fast Track

- change data in .env for your database;
- Log in the EasyAdmin "/admin": username: admin, password: zxzczv;
- to run workers:
    - $ symfony run -d --watch=config,src,templates,vendor symfony console messenger:consume async -vv;
- to run the phpunit tests:
    - change the guestbook to the guestbook_test in .env;
    - $ make tests;