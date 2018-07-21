# Delightful Helm Charts

Delightful and frequent-used helm charts, including:

- [**grpc-service**](charts/grpc-service): gRPC-based services
- [**ingress**](charts/ingress): The helm chart of "stand-alone" ingress with ingress-nginx-controller which means it is NOT dependent on loadbalancers of cloud providers.

For details, see the README.md file of each chart.

## Usage

Take member-service for example


install:

```sh
$ helm install ./member-service
```

list:

```sh
$ helm list

NAME       	REVISION	STATUS  	CHART               	NAMESPACE
elegant-hog	1       	DEPLOYED	member-service-0.1.0	default
```

upgrade

```sh
$ helm upgrade elegant-hog ./member-service
```
