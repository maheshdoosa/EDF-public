variable "adoOrganisation" {
  description = "ADO organisation"
  default     = ".tmp-adoOrg" //intentionally kept it to something unrealistic
}

variable "kvname" {
  description = "key vault name"
  default     = ".tmp-kvname" //intentionally kept it to something unrealistic
}

variable "kvrg" {
  description = "key vault resource group"
  default     = ".tmp-kvrg" //intentionally kept it to something unrealistic
}

variable "adoProjects" {
  type = map(object({
    adoProjectName        = string
    adoProjectDescription = string
  }))
}

variable "adoArmEndpoints" {
  type = map(object({
    adoProjectName        = string
    azArmEndpointName     = string
    azServicePrincipalId  = string
    azServicePrincipalKey = string
    azSpnTenantId         = string
    azSpnSubscriptionId   = string
    azSpnSubscriptionName = string
  }))
}

variable "adoGhEndpoints" {
  type = map(object({
    adoProjectName   = string
    azGhEndpointName = string
    ghPat            = string
  }))
}

variable "adoGhPipelines" {
  type = map(object({
    adoProjectName        = string
    pipelineName          = string
    ymlPath               = string
    serviceConnectionName = string
    ghOrganisation        = string
  }))
}

variable "ghServiceEndPointName" {
  description = "Gh Service EP name"
  default     = ".tmp" //intentionally kept it to something unrealistic
}
