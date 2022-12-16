# docker-automx2

docker image which runs automx2.
Email client configuration made easy. 

[https://github.com/rseichter/automx2](https://github.com/rseichter/automx2)

automx2 makes configuring email accounts easy. It unites methods for automated mailbox configuration from Apple's Mobileconfig, Microsoft's Autodiscover and Mozilla's Autoconfig in one tool. automx2 is successor to automx. It has been designed to be easier to setup, easier to configure and easier to use.

## run container

```bash
docker run -it -p 4243:4243 -v $(pwd)/etc/automx2:/etc/automx2 andif888/docker-automx2
```

### view on dockerhub

[https://hub.docker.com/r/andif888/docker-automx2](https://hub.docker.com/r/andif888/docker-automx2)
