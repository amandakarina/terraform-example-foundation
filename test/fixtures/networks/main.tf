/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module "dev" {
  source                           = "../../../3-networks/envs/dev"
  org_id                           = var.org_id
  access_context_manager_policy_id = var.policy_id
  default_region2                  = "us-central1"
  default_region1                  = "us-west1"
  terraform_service_account        = var.terraform_sa_email
}

module "nonprod" {
  source                           = "../../../3-networks/envs/nonprod"
  org_id                           = var.org_id
  access_context_manager_policy_id = var.policy_id
  default_region2                  = "us-central1"
  default_region1                  = "us-west1"
  terraform_service_account        = var.terraform_sa_email
}

module "prod" {
  source                           = "../../../3-networks/envs/prod"
  org_id                           = var.org_id
  access_context_manager_policy_id = var.policy_id
  default_region2                  = "us-central1"
  default_region1                  = "us-west1"
  terraform_service_account        = var.terraform_sa_email
}
