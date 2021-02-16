locals {
  repos = [for repo in var.repos: merge(repo, {
    files = defaults(repo.files, {
      create_file = true
      branch = "master"
      content = " "
      commit_message = "Test commit for testing Terrafomr modules"
      commit_author = "TerraformTestUser"
      commit_email = "terraformtesting@example.com"
    })
    auto_init = true
    create_repo = true
  })]
  files = [for repo in local.repos: flatten(setproduct([repo.name], repo.files))]
}

resource "github_repository" "this" {
  for_each = {for repo in local.repos: repo.name => repo if repo.create_repo}
  name      = each.value.name
  auto_init = each.value.auto_init
}

resource "github_repository_file" "this" {
  count = length(local.files)
  repository          = element(local.files, count.index)[0]
  branch              = element(local.files, count.index)[1].branch
  file                = element(local.files, count.index)[1].file
  content             = element(local.files, count.index)[1].content
  commit_message      = element(local.files, count.index)[1].commit_message
  commit_author       = element(local.files, count.index)[1].commit_author
  commit_email        = element(local.files, count.index)[1].commit_email
  overwrite_on_create = element(local.files, count.index)[1].overwrite_on_create
}