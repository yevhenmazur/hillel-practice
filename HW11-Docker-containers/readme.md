This image allows you to run the popular HUGO static website engine.

Please mount /src/ directory as a volume, otherwise the content of your site will be lost when the container is stopped!

You can pass the name of your site as a SITENAME environment variable. If you launch the container for this site for the first time, the script inside the container will automatically create the directory structure and configure the ananke theme. You can change the theme after launch.

### Run ###
docker run --detach --rm --volume ./src/:/src -p 80:1313 -e SITENAME='my.seite.com' yevhenmazur/hugo:0.122.0-1
