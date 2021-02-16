variable "repos" {
    description = "Configurations for github files"
    type = list(object({
        create_repo = optional(bool)
        name = string
        files = list(object({
            create_file = optional(bool)
            branch              = optional(string)
            file                = string
            content             = optional(string)
            commit_message      = optional(string)
            commit_author       = optional(string)
            commit_email        = optional(string)
            overwrite_on_create = bool
        }))
    }))
    default = []
}