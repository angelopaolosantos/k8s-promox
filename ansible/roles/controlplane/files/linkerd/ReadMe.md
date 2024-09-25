# Generating the certificates with step

You must generate these certificates to install linkerd via ansible or helm

## Install step-cli
https://smallstep.com/docs/step-cli/installation/

## Trust anchor certificate
```
step certificate create root.linkerd.cluster.local ca.crt ca.key \
--profile root-ca --no-password --insecure
```

## Issuer certificate and key
```
step certificate create identity.linkerd.cluster.local issuer.crt issuer.key \
--profile intermediate-ca --not-after 8760h --no-password --insecure \
--ca ca.crt --ca-key ca.key
```

## Install the linkerd-crds chart
```
helm install linkerd-crds linkerd/linkerd-crds -n linkerd --create-namespace
```

## Install the linkerd-control-plane chart:
```
helm install linkerd-control-plane -n linkerd \
  --set-file identityTrustAnchorsPEM=ca.crt \
  --set-file identity.issuer.tls.crtPEM=issuer.crt \
  --set-file identity.issuer.tls.keyPEM=issuer.key \
  linkerd/linkerd-control-plane
```
