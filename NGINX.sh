# After NGINX is installed, you only need the following code inside
# the file located at: /etc/nginx/sites-available/default

server {

  root /var/www/html;

  index index.html index.htm index.nginx-debian.html;
  server_name EXAMPLE.com; # EDIT_ME

        location / {
                  # option 1. If you're using 2 instances, uncomment proxy_pass below
                # proxy_pass http://ClientIPAddress:3000; # EDIT_ME 
                
                  # option 2. If you're using 1 instance, uncomment proxy_pass below
                # proxy_pass http://localhost:3000; 
                
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection 'upgrade';
                proxy_set_header Host $host;
                proxy_cache_bypass $http_upgrade;
        }

}
