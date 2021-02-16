output "repo_clone_urls" {
    value = {for repo in github_repository.this: repo.name => repo.http_clone_url}
}
