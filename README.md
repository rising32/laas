# laas
laundry-as-a-service ( laas ) is an opensource API that are focused on task queue, scheduling / reminder, and transaction management on a laundry business model. Stock database migration are also available in ```laas/pkg/model/_handbook/dbdump.sql``` to provide an easier deployment aspect.

``` bash
# environment variables
DB_HOST=[host]
DB_USER=[user]
DB_PASSWORD=[password]
DB_DATABASE=[db_name]
DB_PORT=[db_port]
PORT=[app_port]
SECRET_KEY=[jwt_secret_key]
```
```bash
# external modules' dependencies
- github.com/joho/godotenv
- github.com/gin-gonic/gin
- github.com/go-sql-driver/mysql
- github.com/jinzhu/gorm
```
``` bash
# api's endpoints
./api
├─ /user
│  ├── /guest
│  │   ├── /add
│  │   ├── /show
│  │   └── /profile/:username
│  │       ├── /update
│  │       │   ├── /address
│  │       │   ├── /password
│  │       │   └── /phone
│  │       ├── /close
│  │       ├── /open
│  │       ├── /delete
│  │       └── ..
│  └── ..
└── ..
```