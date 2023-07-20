locals {
  repositories = {
    eit-azure-lz-base = {
      description = "should contain artifacts the constitute lz foundational state"
      review      = var.ghRepoNumOfReviewersEnforced
    }

    eit-azure-lz-adforest = {
      description = "should contain artifacts that enables azure lz with AD forest"
      review      = var.ghRepoNumOfReviewersEnforced
    }
  }

  _repositories = {
    for k, v in local.repositories : k => {
      description = v.description
      name        = k
      review      = v.review
    }
  }

}
