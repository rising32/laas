# laas
laundry-as-a-service ( laas ) is an opensource API that are focused on task queue, scheduling / reminder, and transaction management on a laundry business model.

``` bash
# environment variable
DB_HOST=[host]
DB_USER=[user]
DB_PASSWORD=[password]
DB_DATABASE=[db_name]
DB_PORT=[db_port]
PORT=[app_port]
```

``` bash
# api's endpoint
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
│  │       ├── /delete
│  │       └── ..
│  └── ..
└── ..
```