provider "helm" {
  kubernetes {
    config_path = "/home/vagrant/.kube/helm-test"
  }
}

provider "kubernetes" {
  config_path = "/home/vagrant/.kube/helm-test"
}


resource "kubernetes_namespace" "test-namespace" {
  metadata {
        name = "test"
  }
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  namespace  = "test"
  

  #repository = "https://charts.bitnami.com/bitnami"
  chart      = "/home/vagrant/terraform-kube/prometheus-grafana-minikube/prometheus"

  set {
    name  = "service.type"
    value = "NodePort"
  }
}

resource "helm_release" "grafana" {
  name       = "grafana"
  namespace  = "test"
  

  #repository = "https://charts.bitnami.com/bitnami"
  chart      = "/home/vagrant/terraform-kube/prometheus-grafana-minikube/grafana"

  set {
    name  = "service.type"
    value = "NodePort"
  }
}



