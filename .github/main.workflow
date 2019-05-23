workflow "Release" {
  on = "push"
  resolves = ["yarn exec semantic-release"]
}

action "yarn install" {
  uses = "Borales/actions-yarn@master"
  args = "install"
}

action "yarn exec semantic-release" {
  uses = "Borales/actions-yarn@master"
  args = "exec semantic-release"
  secrets = ["GH_TOKEN", "NPM_TOKEN"]
  needs = ["yarn install"]
}
