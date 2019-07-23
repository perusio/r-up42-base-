# Building UP42 processing blocks using R

## Introduction

This repository provides the Dockerfile and supporting scripts needed
to use [R](https://en.wikipedia.org/wiki/R_(programming_language)) for
building [UP42](https://up42.com) 
[processing blocks](https://docs.up42.com/getting-started/core-concepts.html#blocks).

## Requirements

 [Docker](https://docs.docker.com/install/).
 
## Usage

### Building the docker image

 1. Clone the repository: `git clone https://github.com/perusio/up42-r-base`
 2. `cd up42-r-base`
 2. Build the image, for example:
 ```bash
 docker build -t up42-r:1.0 . 
 ```

The Docker 
[image tag](https://docs.docker.com/engine/reference/commandline/build/#tag-an-image--t)
given here is `up42-r:1.0` it is up to you to tag it as you
wish. This is just an example.
 
Now if you do:
 
```bash
 docker images
```
 
```bash
REPOSITORY                                                                                 TAG                 IMAGE ID            CREATED             SIZE
up42-r                                                                                     1.0                 d179fa0172df        11 hours ago        606MB
rocker/r-ver                                                                               latest              d179fa0172df        11 hours ago        606MB
```

you should see the image you just created.
 
 
### Running the docker image interactively
 
The image provided is a base image. To get to the final image you need
to run your algorithm (processing block) it is recommended you use the
image interactively and use the R shell to install the required
packages.


```bash
docker run -ti --rm up42-r:1.0

```

You should enter the image and be dropped in the R prompt:

```bash
docker run -ti --rm up42-r:1.0

R version 3.6.1 (2019-07-05) -- "Action of the Toes"
Copyright (C) 2019 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

>
```

It is up to you now to install the packages you need.

## TODO

 1. Provide base packages for satellite data processing.
 2. Move this to be a UP42 owned repo.
