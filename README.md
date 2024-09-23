# multiplatform_ci_mwe

An MWE for testing using Github Actions to build single-architecture Docker images on appropriate build hosts (amd64 or arm64), then combine them into a single multi-architecture manifest in the Github Package Registry.

All of the interesting stuff is in [.github/workflows/docker.yaml](.github/workflows/docker.yaml)

As we're ultimately interested in ROS2 packages, this implements a trivial task on top ROS base images.

## License

Blue is released under the MIT license.
