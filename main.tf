

resource "random_password" "api_key" {
  length  = 40
  upper   = false
  special = false

  keepers = {time = time_rotating.api_key.id}
}

resource "time_rotating" "api_key" {
  rotation_minutes = 1
}

locals {
  last_password_change = {"password_date" = "04/16/2024"}
}

resource "random_password" "db_password" {
  length  = 40
  upper   = false
  special = false

  keepers = local.last_password_change
}
