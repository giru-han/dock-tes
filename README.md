# docker-testing for python

1. Setup Firewall
   ```
   sudo ufw enable
   sudo ufw allow 80
   sudo ufw reload
   sudo ufw status
   ```

2. Kill all apps that using port 5061, 443
   ```
   sudo lsof -i -P -n | grep LISTEN
   sudo lsof -i -P -n | grep LISTEN | grep -E '(:5601|:443)' | awk '{print $2}' | xargs sudo kill -9
   ```

3. Install Docker
   ```
   sudo apt install docker-buildx
   sudo systemctl start docker
   sudo systemctl enable docker
   sudo systemctl status docker
   sudo usermod -aG docker ${USER}
   docker run hello-world
   ```

4. Clone repo
   ```
   git clone https://github.com/giru-han/dock-test.git
   ```

5. Built Image and run Container by mounting secrets
   ```
   docker build -t gotest .
   docker run --rm -it -p 443:443 \
     --env-file /home/giru/.env \
     -v /{main nginx source}/nginx.conf:/etc/nginx/nginx.conf \
     -v /{site nginx source}/nginx.conf:/etc/nginx/sites-available/nginx.conf \
     -v /{ssl cert source}/fullchain.pem:/etc/letsencrypt/live/{yourdomain.com)/fullchain.pem \
     -v /{ssl cert source}/privkey.pem:/etc/letsencrypt/live/{yourdomain.com)/privkey.pem \
     --name gotest_container \
     gotest
   ```

6. Stop Docker Container
   ```
   docker ps
   docker stop gotest_container
   docker kill gotest_container
   docker rmi gotest # Delete Image
   ```

6. Debug   
   Sync repo from git
      `git pull origin main`
   
   Start Container in debug mode
      `docker run --rm -it -p 80:80 gotest /bin/bash`
   
   Start Container with mount file
      `docker run -it -v /home/test.py:/app/mex.py gotest`
   
   Debug into running container
      `docker exec -it gotest_container /bin/bash`
   
   
