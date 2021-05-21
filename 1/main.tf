terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "3.6.0"
    }
  }
}

provider "gitlab" {
    token = var.gitlab_token
    base_url = "http://3.108.52.155"
}

variable "gitlab_token" {
       default = "rysjyZmsCyPWAaBL1DCz"
}

resource "gitlab_project" "project_1" {
    name = "project_1"
}

resource "gitlab_project" "project_2" {
    name = "project_2"
}

resource "gitlab_group" "Devs" {
  name = "Devs"
  path = "example"
  description = "First group"
}

resource "gitlab_group" "Admins" {
  name = "Admins"
  path = "example1"
  description = "Second group"
}

resource "gitlab_user" "user-1" {
  name             = "user-1"
  username         = "test1"
  password         = "Password1"
  email            = "akashca@codemancers.com"
  is_admin         = true
  projects_limit   = 4
  can_create_group = false
  is_external      = true
  reset_password   = false
  }

  resource "gitlab_user" "user-2" {
  name             = "user-2"
  username         = "test2"
  password         = "Password2"
  email            = "bipinoctca@gmail.com"
  is_admin         = true
  projects_limit   = 4
  can_create_group = false
  is_external      = true
  reset_password   = false
}

resource "gitlab_group_membership" "gm-1" {
  group_id     = "6"
  user_id      = 4
  access_level = "guest"
}

resource "gitlab_group_membership" "gm-2" {
  group_id     = "8"
  user_id      = 5
  access_level = "guest"
}

 