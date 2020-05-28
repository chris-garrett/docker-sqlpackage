# docker-sqlpackage

* Sqlpackage 15.0.4769.1

## Versions
- Ubuntu 18.04 - https://ubuntu.com/
- Sqlpackage 15.0.4769.1 - https://docs.microsoft.com/en-us/sql/tools/sqlpackage?view=sql-server-ver15
- Dockerize v0.6.0 - https://github.com/jwilder/dockerize

## Usage

*nix
```
docker run --rm -it \
  -v ${pwd}/data:/work/data \
  chrisgarrett/sqlpackage:20.05.09 \
  sqlpackage /a:Import /tsn:sqlserver /tdn:"nwind" /tu:sa /tp:"SaPassword" /sf:"/work/data/northwind.bacpac" 
```

Windows cmd
```
docker run --rm -it -v %cd%/data:/work/data chrisgarrett/sqlpackage:20.05.09 sqlpackage /a:Import /tsn:sqlserver /tdn:"nwind" /tu:sa /tp:"SaPassword" /sf:"/work/data/northwind.bacpac" 
```

Windows Powershell
```
docker run --rm -it -v ${pwd}/data:/work/data chrisgarrett/sqlpackage:20.05.09 sqlpackage /a:Import /tsn:sqlserver /tdn:"nwind" /tu:sa /tp:"SaPassword" /sf:"/work/data/northwind.bacpac" 
```

See the example folder for a more complete demonstration of sqlpackage loading northwind into sqlserver. Requires [go-task](https://github.com/go-task/task/releases): 

```
cd example
task restart log
```

## Credits

Used Christian Grotheer's work as a launch point https://github.com/grthr/docker-sqlpackage

