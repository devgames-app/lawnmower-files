docker stop mysql redis
docker-compose -f hk4e.yml down -v --remove-orphans

docker compose kill
docker compose rm -f

rmdir /s /q "%cd%\data\mysql"
rmdir /s /q "%cd%\data\redis"

docker compose -f docker-preinstall.yml up preparevars
docker compose -f docker-preinstall.yml kill preparevars
docker compose -f docker-preinstall.yml rm -f preparevars

echo. > .bootstrap.lock

docker compose -f hk4e.yml up -d --build
pause