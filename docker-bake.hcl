#
# Override these variables with environment variables
# e.g.
#
#   BUILDX_ROS_DISTRO=iron docker buildx bake
#
# or
#
#   export BUILDX_ROS_DISTRO=iron
#   docker buildx bake
#
variable "BUILDX_ROS_DISTRO" { default = "rolling" }
variable "BUILDX_GITHUB_REPO" { default = "amarburg/mutiplatform_ci_mwe" }

group "default" {
  targets = ["mwe"]
}

# These are populated by the metadata-action Github action for each target
# when building in CI
#
target "docker-metadata-action" {}

#
# All images can pull cache from the images published at Github
# or local storage (within the Buildkit image)
#
# ... and push cache to local storage
#
target "mwe" {
  inherits = ["docker-metadata-action"]
  dockerfile = "Dockerfile"
  target = "mwe"
  args = {
    ROS_DISTRO = "${BUILDX_ROS_DISTRO}"
  }
  tags = [
    "ghcr.io/${BUILDX_GITHUB_REPO}:${BUILDX_ROS_DISTRO}-ci"
  ]
  labels = {
    "org.opencontainers.image.source" = "https://github.com/${BUILDX_GITHUB_REPO}"
  }
  cache_from =[
    "ghcr.io/${BUILDX_GITHUB_REPO}:cache-${BUILDX_ROS_DISTRO}",
    "type=local,dest=.docker-cache"
  ]
  cache_to = [
    "type=local,dest=.docker-cache"
  ]
  platforms = ["linux/amd64", "linux/arm64"]
}

