# Squid Proxy Server with Docker
Squid is a lightweight and customizable proxy server packaged as a Docker container. It allows you to set up a Squid proxy quickly and efficiently, providing enhanced security and optimized content delivery for your applications.

## Features
1. Containerized Deployment: Run Squid proxy inside a Docker container for easy portability and deployment.
2. HTTP and HTTPS Proxy: Facilitate both HTTP and HTTPS proxy services, ensuring secure internet browsing.
3. Custom Configuration: Easily customize Squid proxy settings according to your specific requirements.

## Usage
1. Pull the Docker Image:
  ```bash
  docker pull fossyy/squid:latest
  ```
2. Run the Docker Container:
  ```bash
  docker run -d -p 3128:3128 \
  -e AUTH_PARAM_BASIC_PROGRAM="/usr/lib/squid/basic_ncsa_auth /etc/squid/passwd" \
  -e AUTH_PARAM_BASIC_CHILDREN=5 \
  -e AUTH_PARAM_BASIC_REALM="Squid Basic Authentication" \
  -e AUTH_PARAM_BASIC_CREDENTIALSTTL="2 hours" \
  --name squid-proxy fossyy/squid:latest
  ```
3. Add a New Proxy User:
  To add a new proxy user with a password, use the following command:
  ```bash
  docker exec -it squid-proxy htpasswd -cb /etc/squid/passwd username password
  ```
  Replace username with the desired username and password with the corresponding password. This command sets the password directly without a prompt.

Now, your Squid proxy server is up and running, and you have added a new proxy user! You can further customize the Squid proxy configuration by editing the squid.conf file or modifying the environment variables during container startup.

For detailed customization options, refer to the [Squid Documentation](http://www.squid-cache.org/).
