# docker-cellorganizer-galaxy
CellOrganizer + Galaxy over Docker

To build the container, use the command

```
docker build -t icaoberg/cellorganizer .
```

To run an interactive session, use the command

```
docker run -i -t -p 8080:80 icaoberg/cellorganizer /bin/bash
```
