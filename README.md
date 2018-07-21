# Delightful Helm Charts

Delightful and frequent-used helm charts, including:

- [**grpc-service**](charts/grpc-service): gRPC-based services
- [**ingress**](charts/ingress): The helm chart of "stand-alone" ingress with ingress-nginx-controller which means it is NOT dependent on loadbalancers of cloud providers.

For details, see the README.md file of each chart.

## Usage

Take [member-service](charts/example/member-service.yaml) for example

install:

```sh
$ helm install --values ./charts/grpc-service/example/member-service.yaml ./charts/grpc-service
```

list:

```sh
$ helm list

NAME       	REVISION	STATUS  	CHART               	NAMESPACE
elegant-hog	1       	DEPLOYED	member-service-1.0.0	default
```

upgrade

```sh
$ helm upgrade --values ./charts/grpc-service/example/member-service.yaml elegant-hog ./charts/grpc-service
```
