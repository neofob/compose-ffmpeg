Running the latest `ffmpeg` in docker
=====================================
*Running a script that uses `ffmpeg` using docker*

`entrypoint` script [`exau.sh`][0] uses `ffmpeg` to do its thing.
Running the script in a `ffmpeg` docker can take advantage of the latest
version. Path to media files: `/tmp/old_vinyls` with `*.mp4 *.webm *.mkv`
patterns.
```
$ WORK_DIR=/tmp/old_vinyls docker-compose up
```

Checking the config file and environment variables
==================================================
```
$ docker-compose config
```

Default Settings for `docker-compose.yml`
=========================================
| `Environment Variable` | `Default Setting` | What it is |
|:----------------------:|:-----------------:|:----------:|
|         `WORK_DIR`     |      `$PWD`       | Path to media files, which can also be set in `.env` file | 
|     `ENTRYPOINT`       | `$PWD/scripts/exau.sh` | entrypoint script to run |
|     `DOCKER_IMG`       | `jrottenberg/ffmpeg` | Docker image that has `ffmpeg` |
|     `DOCKER_TAG`       | `latest`           | Docker image tag |


Default Settings for the script running inside docker
=====================================================
See [`work.env`][1] and the running script.

[0]: scripts/exau.sh
[1]: work.env
