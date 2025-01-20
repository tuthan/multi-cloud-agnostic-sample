resource "kubernetes_manifest" "argocd" {
  depends_on = [
    module.argocd
  ]
  for_each =fileset("static/argocd", "*.tftpl")
  manifest = yamldecode(
    templatefile(
      "static/argocd/${each.value}",
      {
        //additional variables
      }
    )
  )
}