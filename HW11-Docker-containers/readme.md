This image lets you run the popular [HUGO](https://gohugo.io) static website engine. ==This image was developed for educational purposes. Please do not use it in production!==

## How to use

Mount /src/ directory as a volume, otherwise the content of your site will be lost when the container is stopped!

You can pass the name of your site as a SITENAME environment variable. If you launch the container for this site for the first time, the script inside the container will automatically create the directory structure and configure the [ananke theme](https://github.com/theNewDynamic/gohugo-theme-ananke). You can change the theme later.

## How to run
An example of a run command:

`docker run --detach --rm --volume ./src/:/src -p 80:1313 -e SITENAME='my.seite.com' yevhenmazur/hugo:0.122.0-1`

## How to build

The build command is stored in the `build.sh` file.

The server inside the container is run by a user with limited permissions. You can override the UID and GID of this user to manage permissions in /src directory flexibly. To do this, pass them as arguments during the build.

For example:

`docker build --build-arg UID=1001 --build-arg GID=1024 -t yevhenmazur/hugo:0.122.0-1 ./`

### Docker Compose
You can also use Docker Compose to build and run the application. To do this, edit the values of the variables in the `.env` file and run the command

`docker compose up`