# LaaS // (n). Laundry as a Service
**LaaS** is an opensource API that are focused on task queue, scheduling / reminder, and transaction management on a laundry business model. LaaS will be compatible soon with ```laas-client``` that are hosted here in hotpotcookie's github repos, which provide an easier full-stack infrastucture to be used locally. On the client side, it will be written in ```Vanilla JS```

**LaaS** use RDBMS by MySQL version 8.0.27 as its database platform, which contains triggers for certain actions. It will also be using views as for the client-side, so the privacy are still maintained not hardcoded to the responses. Stock database migration are available in ```laas/pkg/model/_handbook``` to provide an easier management aspect.

Here are some key overviews that will help you get started, More details will be documented in the ```doc``` entry point, so it can be separated from the API. Hope it helps for you, cheers 👊

## Environment Variables
``` bash
DB_HOST=[host]
DB_USER=[user]
DB_PASSWORD=[password]
DB_DATABASE=[db_name]
DB_PORT=[db_port]
PORT=[app_port]
SECRET_KEY=[jwt_secret_key]
```
## Dependencies
```bash
github.com/joho/godotenv
github.com/gin-gonic/gin
github.com/go-sql-driver/mysql
github.com/jinzhu/gorm
```
## Endpoints
``` bash
.
├── /
├── /api
│   ├── /user
│   │   ├── /guest
│   │   │   ├── /add
│   │   │   ├── /show
│   │   │   └── /:username
│   │   │       ├── /update
│   │   │       │   ├── /profile
│   │   │       │   └── /password
│   │   │       ├── /close
│   │   │       ├── /open
│   │   │       ├── /delete
│   │   │       └── ..
│   │   ├── /staff
│   │   │   ├── /add
│   │   │   ├── /show
│   │   │   └── /:username
│   │   │       ├── /update
│   │   │       │   ├── /profile
│   │   │       │   └── /password
│   │   │       └── ..
│   │   └── ..
│   └── ..
├── /doc
│   ├── /installation
│   └── ..
└── ..	
```
## ERD Database
![dbmodeller](https://user-images.githubusercontent.com/70483046/151471519-60d5269a-4962-4c4b-b255-e848b808aafb.jpeg)


## Contributions
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change. Please make sure to update tests as appropriate. 👏
