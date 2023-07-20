variable "adoProjects" {
  type = list(string)
  default = [
    "tmp1",
    "tmp2"
  ]
}

variable "ghServiceEndPointName" {
  description = "End point name"
  default     = ".tmp" //intentionally kept it to something unrealistic
}

variable "ghServiceEndPointPat" {
  description = "GH PAT"
  default     = ".tmp" //intentionally kept it to something unrealistic
}
