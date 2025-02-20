# Getting start

## Develop with notebok
```
    docker compose build
    docker compose up -d
    //visit localhost:8080. jupyter notebook kernel is started
```

## Develop inside container
```
    docker exec -it khdev /bin/bash
```

## Mount local data folder

1. Create `.env`
2. Add `LOCAL_DATA_PATH=<absolute-path-to-data-folder>`
3. `docker compose down & docker compose up -d`