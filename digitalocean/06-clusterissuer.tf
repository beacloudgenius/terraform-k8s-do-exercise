data "template_file" "cluster-issuer" {
  template = "${file("templates/cluster-issuer.yaml.tpl")}"

  vars = {
    EMAIL = "nilesh@cloudgeni.us"
  }
}

resource "null_resource" "cluster-issuer" {
  depends_on = [helm_release.cm]

  triggers = {
    manifest_sha1 = "${sha1("${data.template_file.cluster-issuer.rendered}")}"
  }

  provisioner "local-exec" {
    command = <<EOT


      while true
      do
      if [ "$(kubectl get apiservice v1beta1.webhook.cert-manager.io -o jsonpath='{.status.conditions[?(@.type=="Available")].status}')"  = 'True' ] ; then
            sleep 30 && break
        else
            echo "Waiting for v1beta1.webhook.cert-manager.io ..." && sleep 1
        fi
      done
    EOT
  }

  provisioner "local-exec" {
    command = "kubectl apply -f -<<EOF\n${data.template_file.cluster-issuer.rendered}\nEOF"
  }
}
