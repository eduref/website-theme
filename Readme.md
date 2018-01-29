# EduRef Website Theme

This is our custom theme for [Grav CMS](https://getgrav.org/) running at [eduref.eu](http://eduref.eu) based on [Grav Antimatter theme](https://github.com/getgrav/grav-theme-antimatter).
All our website content is seperated in [another repository](https://github.com/eduref/website-content).


## Contribute

If you want to improve our theme, you should start with learning some [basics about grav](https://learn.getgrav.org/).
For theme development the [theme tutorial](https://learn.getgrav.org/themes/theme-tutorial) is highly recommended.

To see everything in action you should configure a local setup.

## Installation

Our installation process for Grav comes in two flavours...

### Docker (recommended)

The docker image cares about everything. It contains the Grav installation including this theme.
For local testing, a default user `admin` with password `admin` is created.
Furthermore docker downloads all website content from our [content repository](https://github.com/eduref/website-content):


1. Install [Docker Community Edition](https://docs.docker.com/install/) (Windows users: check the [requirements](https://docs.docker.com/docker-for-windows/install/#what-to-know-before-you-install))
1. Run from repository root `docker build -t eduref-website .` to build the docker image
1. Run the image with `docker run -p 80:80 eduref-website` as a container
2. The website should run at [http://localhost/grav-admin/](http://localhost/grav-admin/)


### Manual

Configure a Webserver (e. g. Apache) with php on your own.

1. [Install Grav](https://learn.getgrav.org/basics/installation) in web root
1. Copy the `antimatter` folder info `user/themes` of your grav installation
1. Check of [troubleshooting guide](https://learn.getgrav.org/troubleshooting) if someting wents wrong.