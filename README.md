# docker-python-slim-iot
[![docker-image](https://github.com/danielschenk/docker-python-slim-iot/actions/workflows/docker-image.yml/badge.svg)](https://github.com/danielschenk/docker-python-slim-iot/actions/workflows/docker-image.yml)
[![CodeQL](https://github.com/danielschenk/docker-python-slim-iot/actions/workflows/codeql-analysis.yml/badge.svg)](https://github.com/danielschenk/docker-python-slim-iot/actions/workflows/codeql-analysis.yml)
🐳 A multi-arch Docker image based on the official slim Python image, with essential IoT libs

I created this base image from lessons learned in a couple of my other hobby projects.
In those other projects, I wanted to build a Docker image with the
[cryptography lib](https://github.com/pyca/cryptography) in it (an indirect dependency
of several other Python libs I use). At the same time I wanted those images to be usable
on my Raspberry Pi, which at some point in time, I wasn't running a 64-bit version of
Raspbian on yet.

Since PyPI doesn't have prebuilt wheels of cryptography available for all versions of ARM,
ir has to be compiled from source during the Docker build for some archs, which involves
preparing some additional dependencies. This Dockerfile takes care of that while also
leveraging a multi-stage build to keep the image as small as possible.
