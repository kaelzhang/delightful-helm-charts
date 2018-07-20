# Helm charts of ost.ai

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

## Unified Abbr Convention

### Enum Suffixes

- **MP**: 小程序 mini program，包括小游戏
- **SUB**: 订阅号 subscription account
- **SA**: 服务号 service account

### Emails

```mustache
i+ost.ai-{{platform}}-{{account-type}}-{{app-desc}}@kael.me
```

For example:

```
i+ost.ai-wechat-mp-paipai@kael.me
```

wechat | mp | paipai
---- | ---- | ----
微信 | 小程序 | 拍牌
