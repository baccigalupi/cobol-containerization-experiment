# COBOL containerization experiment!

## Run the COBOL

1. Build the image: `docker build -t cobol-container .`
2. Run the script that interests you
* `docker run -it cobol-container dist/invest`
* `docker run -it cobol-container dist/report`

NOTE: Check out the `Dockerfile` to see what scripts are available.

## Cleanup!

You might make a lot of images while building containers, especially if
you don't use the `-t` flag to write them to the same name. They will take up
space on your hardrive quickly.

1. Check out what images you have on board: `docker images`
2. Delete them: `script/clean.sh`
