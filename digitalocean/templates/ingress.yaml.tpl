apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: ${INGRESS_NAME}
  annotations:
    kubernetes.io/ingress.class: nginx
    cert-manager.io/cluster-issuer: letsencrypt-prod
spec:
  rules:
  - host: ${HOSTNAME}
    http:
      paths:
        - path: ${PATH}
          backend:
            serviceName: ${SERVICENAME}
            servicePort: ${SERVICEPORT}
  tls:
    - hosts:
        - ${HOSTNAME}
      secretName: ${HOSTNAME}-tls
