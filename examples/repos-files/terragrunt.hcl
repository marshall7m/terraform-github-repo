include {
    path = find_in_parent_folders("github.hcl")
}

terraform {
    source = "../../modules//testing"
}

inputs = {
    repos = [
        {
            name = "foo"
            files = [
                {
                    branch = "master"
                    file = "dog.txt"
                    content = "dog"
                    commit_message = "dog"
                    overwrite_on_create = true
                },
                {
                    branch = "master"
                    file = "cat.txt"
                    content = "cat"
                    commit_message = "cat"
                    overwrite_on_create = true
                }
            ]
        },
        {
            name = "bar"
            files = [
                {
                    branch = "master"
                    file = "turtle.txt"
                    content = "turtle"
                    commit_message = "turtle"
                    overwrite_on_create = true
                },
                {
                    branch = "master"
                    file = "squid.txt"
                    content = "squid"
                    commit_message = "squid"
                    overwrite_on_create = true
                }
            ]
        }
    ]
}
