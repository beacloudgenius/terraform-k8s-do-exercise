brew install terraform helm kubectl doctl
helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm repo add jetstack https://charts.jetstack.io
helm repo update


extract volume handle using

    doctl compute volume list

update volume handle in digitalocean/existingPV-uses-existing-disk.yaml

    volumeHandle: yourvolumehandlegoeshere


cd digitalocean
terraform init
terraform plan
terraform apply



get cert manager pod name

        kubectl get po -n cert-manager

watch cert manager logs

        kubectl logs -f -n cert-manager cm-cert-manager-b9c859fdc-wh8q8


edit tutum ingress to match your domain name

then

        cd digitalocean
        kubectl apply -f tutum
