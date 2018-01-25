If application is already build and pushed into docker-hub -> Use directly exercise5.yaml

Else
1. Add docker-hub ID into the Application/docker-compose.yml file 
2. build the images using command docker-compose build .
3. Push the images to docker-hub using command docker-compose push (but do a docker login before pushing)
4. Now use exercise5.yaml file