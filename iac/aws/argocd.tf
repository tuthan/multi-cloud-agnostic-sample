module "argocd" {
  source = "../modules/argocd"
  helm_version = var.argo_helm_version
  ha_enabled = false
  server_insecure = false
}