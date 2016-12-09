This Docker image is used at Decemberborn Interactive to automate
builds and running unit tests for [http://decemberborn.com/games/cathedral](Cathedral) in our CI environment.

We initially used https://github.com/andystanton/docker-gcc-cmake-gl
as a base, but decided to create our own version instead of
updating/installing packages such as a newer CMake on each build. This
significantly reduces our CI build times.

The main technologies used is `gcc 4.9`, `boost 1.57`, `CMake 3.3`,
`Python 2.7`. We also install `Pillow` that we use for texture loading
in prebuild steps.

The image is very specific to our use-case, but hopefully someone
else might find it useful too.

