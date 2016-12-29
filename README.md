# COBOL containerization experiment!

## Run the COBOL

1. Build the image: `docker build -t investment-value .`
2. Run the compiled script: `docker run -it investment-value dist/invest`

## Cleanup!

You might make a lot of images while building containers, especially if
you don't use the `-t` flag to write them to the same name. They will take up
space on your hardrive quickly.

1. Check out what images you have on board: `docker images`
2. Delete them: `docker rmi <image-id>`
