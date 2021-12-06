#!/bin/bash

# install Gitlab Runner
# Reference:
# 1. https://docs.gitlab.com/runner/install/
# Replace ${arch} with any of the supported architectures, e.g. amd64, arm, arm64
# A full list of architectures can be found here https://gitlab-runner-downloads.s3.amazonaws.com/latest/index.html
curl -LJO "https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_amd64.deb"

sudo dpkg -i gitlab-runner_amd64.deb
sudo chmod +x /usr/local/bin/gitlab-runner
sudo gitlab-runner start
rm gitlab-runner_amd64.deb
# sudo gitlab-runner register --url https://gitlab.com/ --registration-token <token>