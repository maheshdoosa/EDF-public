resource "github_repository" "targetRepos" {
  for_each = { for k, v in local._repositories : k => v }

  name               = each.value.name
  description        = each.value.description
  private            = true
  has_issues         = true
  has_projects       = false
  has_wiki           = false
  allow_merge_commit = true
  allow_squash_merge = true
  allow_rebase_merge = false
  has_downloads      = false
  auto_init          = true
}

resource "github_branch_protection" "targetReposBranchProtection" {
  for_each = { for k, v in local._repositories : k => v }

  repository     = each.value.name
  branch         = "master"
  enforce_admins = false

  required_status_checks {
    strict = true
    //contexts = "" // will be enforced later
  }

  required_pull_request_reviews {
    dismiss_stale_reviews = true
    //require_code_owner_reviews      = true //for later on
    required_approving_review_count = each.value.review
    //dismissal_teams                 = [var.team_name] //for later on
  }

  depends_on = [
    github_repository.targetRepos
  ]
}
