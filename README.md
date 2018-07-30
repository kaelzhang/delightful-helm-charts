# Delightful Helm Charts

Delightful and frequent-used helm charts, including:

- [**basic-service**](basic-service): A basic helm chart for services based on HTTP/TCP.
- [**external-service**](external-service): More convenient way to batch create [endpoints](https://kubernetes.io/docs/concepts/services-networking/service/#services-without-selectors).

For details, see the README.md file of each chart.

## Usage

Take [member-service](charts/example/member-service.yaml) for example

install:

```sh
$ helm install --values ./basic-service/example/member-service.yaml ./basic-service
```

list:

```sh
$ helm list

NAME       	REVISION	STATUS  	CHART               	NAMESPACE
elegant-hog	1       	DEPLOYED	member-service-1.0.0	default
```

upgrade

```sh
$ helm upgrade --values ./basic-service/example/member-service.yaml elegant-hog ./basic-service
```
