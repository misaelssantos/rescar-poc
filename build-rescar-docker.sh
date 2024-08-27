#!/bin/bash

echo "[DOCKER] BUILD RESCAR - BACKEND"
cd backend/rescar && mvn clean package -Dmaven.test.skip && cp ./target/rescar-spring-0.0.1-SNAPSHOT.jar ../../docker/rescar/rescar-spring-0.0.1-SNAPSHOT.jar

echo "[DOCKER] BUILD RESCAR - FRONTEND"
cd ../../ && rm -rf ./docker/frontend/htdocs && cd frontend/rescar && flutter build web && cp -R ./build/web/ ../../docker/frontend/htdocs