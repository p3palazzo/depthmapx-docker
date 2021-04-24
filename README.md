# depthmapX-docker

A Docker image for the [depthmapX](https://github.com/SpaceGroupUCL/depthmapX/) cli released by the SpaceGroup at University College London. The Ubuntu builder they provide is too bulky for my taste, so I created this leaner image with a fully functional install of the cli using Alpine.

## Quick start

```
docker run --rm --volume "`pwd`:/data" \
  --user "`id -u`:`id -g`" palazzo/depthmapx \
  -f <infile.graph> -o <outfile.graph> -m <mode> \
  [mode options]
```

See the [official documentation](https://github.com/SpaceGroupUCL/depthmapX/blob/master/docs/commandline.md) for more detailed instructions.

## Current `:latest` tag

The current latest tag points to [v0.8.0](https://github.com/SpaceGroupUCL/depthmapX/releases/tag/v0.8.0) from the SpaceGroup at UcL.

Warning :warning: : this version is **not** on the production line
currently maintained by Tasos Varoudis.

## Build your own

Fork this repository, edit the `Makefile` and replace my docker hub
username with yours.

