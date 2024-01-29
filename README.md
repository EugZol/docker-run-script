It is sometimes convenient not to use package manager (`apt`/`brew`, etc.) to install some program, but to use Docker image instead.

This is a set of wrapper scripts to make build and use of such images more convenient.

## Workflow

1. Copy scripts to `~/bin`, `~/images` from this repository
2. Add `~/bin` to `PATH` of your shell
3. Write your own dockerfile for a desired script, e.g. `images/youtube-dl.dockerfile`
  * Name of that file without extension should be the same as name of the command to run inside of the image (i.e. `youtube-dl` in that case)
4. Add section to `images/docker-compose.yml`, following the examples
5. Run `images/build-all`
6. Run `images/wrap-all`
7. Enjoy: run the command with `-docker` postfix as if it is the local script (e.g. `youtube-dl-docker 'https://www.youtube.com/watch?v=UOy-zKKbNe4'` to download video to current directory). Current directory is automatically mounted to the container, command-line arguments are passed.

## Platform-specific usage

Scripts are ready to use on MacOS. When using on Linux:

* Change `zsh` to `bash` in loop body of `images/wrap-all`, and in the first lines of `bin/docker-run-script`, `images/build-all`, `images/wrap-all` (unless you use zsh)
* Remove `platform: linux/x86_64` lines from `docker-compose.yml`. Some images are not compatible with Apple Silicon as is and require that instruction to turn on emulation