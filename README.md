# docker-testing for python

1. Setup Firewall
   ```sudo ufw enable
   sudo ufw allow 80
   sudo ufw reload
    sudo ufw status```

2. Kill Apps that using port use port 5061, 443
   ```sudo lsof -i -P -n | grep LISTEN
```
