module "k8s" {
  source    = "./modules/k8s-namespace"
  namespace = local.namespace
}