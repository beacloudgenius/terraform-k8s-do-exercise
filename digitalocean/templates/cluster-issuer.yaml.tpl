apiVersion: cert-manager.io/v1alpha2
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
  namespace: cert-manager
spec:
  acme:
    # The ACME server URL
    server: https://acme-v02.api.letsencrypt.org/directory
    # Email address used for ACME registration
    email: ${EMAIL}
    # Name of a secret used to store the ACME account private key from step 3
    privateKeySecretRef:
      name: letsencrypt-prod
    solvers:
      - http01:
          ingress:
            class: nginx
      - selector:
          matchLabels:
            use-cloudflare-solver: "true"
        dns01:
          cloudflare:
            email: ${EMAIL}
            apiKeySecretRef:
              name: cloudflare-api-key
              key: api-key
