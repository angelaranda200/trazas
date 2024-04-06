git clone git@ssh.dev.azure.com:v3/MS4M/Control%20Sense%20Web/Gateway_Develop --branch feature/opentelemetry
git clone git@ssh.dev.azure.com:v3/MS4M/Control%20Sense%20Web/HumanResources_Backend --branch feature/opentelemetry
git clone git@ssh.dev.azure.com:v3/MS4M/Control%20Sense%20Web/c4m-portal-frontend --branch feature/opentelemetry

cd Gateway_Develop/
mvn install
docker build -t gd:latest .

cd ..
cd HumanResources_Backend/
mvn clean install -DskipTests
docker build -t hr:latest .

cd ..
cd c4m-portal-frontend/
npm install --force --legacy-peer-deps
npm run build:dev
docker build -t portal:latest .


cd ..
 #comando para ejecutar docker compose
docker compose up
#comando para apagar docker compose
# docker compose down

