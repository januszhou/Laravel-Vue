##Steps

### Screenshots

####Register

![Register](https://github.com/januszhou/ableto-test/blob/master/public/images/Register.png "Register")

####Login
![Login](https://github.com/januszhou/ableto-test/blob/master/public/images/Login.png "Login")

####Admin
![Admin](https://github.com/januszhou/ableto-test/blob/master/public/images/Admin.png "Admin")

####Question
![Question](https://github.com/januszhou/ableto-test/blob/master/public/images/Question.png "Question")

### Create Database
You can restore my local `dump.sql` file, or do manually migration
```
create databas ableto;
create databas ableto_test;

php artisan migration --seeder
php artisan migration --database=testing_db // separate testing db
```

### Sample ENV file
```
APP_ENV=local
APP_KEY=base64:WKGDtWD1+9poqo1sTdkm1QyafQ0OltjoZzCmFXNEVyY=
APP_DEBUG=true
APP_LOG_LEVEL=debug
APP_URL=http://ableto.app

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=ableto
DB_USERNAME=homestead
DB_PASSWORD=secret
DB_TEST_DATABASE=ableto_test

BROADCAST_DRIVER=log
CACHE_DRIVER=file
SESSION_DRIVER=file
QUEUE_DRIVER=sync

REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_DRIVER=smtp
MAIL_HOST=smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null

PUSHER_APP_ID=
PUSHER_APP_KEY=
PUSHER_APP_SECRET=
```

### NPM
Run `npm run dev` before you start it locally

### Roadmap
- For security reason, it needs switch to JWT or Laravel Passport
- Add permission middleware to API
- Admin will has its own dashboard
- Separate vue file into more components, vuex use action if project gets complicated
- Update database schema if we need know each time user answers. Add `time` column on `user` table and put it into `user_question_answer` table
- More API tests, and Vue tests
