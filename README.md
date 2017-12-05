# Lehelchatbot

To build and deploy lehelchatbot using docker:
  Prequisites: linux-based environment

  1) Execute the ./deploy/deploy_app.sh script (which will install docker-compose if not already installed ) which will run the docker-compose script setting up the containers with images and and project files.
  2) In order the chatbot to work in the comments app, the web service must have its port forwarded to outwardly through any firewall so that Google's DialogFlow service is able to post to the Phoenix Web Server's webhook...

  