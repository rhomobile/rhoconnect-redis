RhoConnect Redis
========
RhoConnect Redis is a packaged Redis server for RhoConnect development and production environment on Linux servers.

## Deploying packaged RhoConnect Redis on Linux servers

### Steps for Debian-Based Linux Users

Add the following line to the end of your `/etc/apt/sources.list`

	deb http://rhoconnect-repo.s3.amazonaws.com/packages/deb rhoconnect-repo main

Then update repo list and install RhoConnect Redis

    $ sudo apt-get update
    $ sudo apt-get install rhoconnect-redis


### Steps for RedHat-Based Linux Users
Create a file named `rhoconnect-repo.repo` in the `/etc/yum.repos.d/` directory:

    $ sudo nano /etc/yum.repos.d/rhoconnect-repo.repo

Copy and paste these contents into the file

	[rhoconnect-redis]
	name=Rhoconnec Redis
	baseurl=http://rhoconnect-repo.s3.amazonaws.com/packages/rpm
	enabled=1
	gpgcheck=0

Once that is done, it is time to install RhoConnect Push service

    $ sudo yum install rhoconnect-redis

