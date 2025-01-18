resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          =  var.helm_version
  values = [
    templatefile(
      "${path.module}/../../static/helm-argocd-value.tftpl",
      {
        argocd_host      = "argocd.local"
        server_insecure  = true
        ha_enabled       = false
      }
    )
  ]
}
