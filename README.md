# Delightful Helm Charts

Delightful and frequent-used helm charts, including:

- [**basic-service**](charts/basic-service): A basic helm chart for services based on HTTP/TCP.
- [**ingress**](charts/ingress): The helm chart of "stand-alone" ingress with ingress-nginx-controller which means it is **NOT** dependent on loadbalancers of cloud providers.

For details, see the README.md file of each chart.

## Usage

Take [member-service](charts/example/member-service.yaml) for example

install:

```sh
$ helm install --values ./charts/basic-service/example/member-service.yaml ./charts/basic-service
```

list:

```sh
$ helm list

NAME       	REVISION	STATUS  	CHART               	NAMESPACE
elegant-hog	1       	DEPLOYED	member-service-1.0.0	default
```

upgrade

```sh
$ helm upgrade --values ./charts/basic-service/example/member-service.yaml elegant-hog ./charts/basic-service
```
