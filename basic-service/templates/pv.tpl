{{- if .Values.persistence.enabled -}}
  {{- range $index, $volume := .Values.persistence.volumes -}}
    {{- if $index > 0 -}}
---
    {{- end -}}
kind: PersistentVolume
apiVersion: v1
metadata:
  name: {{ template "basic-service.name" }}-pv-{{ $volume.nameSuffix | default $index }}
spec:
  capacity:
    storage: {{ $volume.storage | default "1Gi" }}
  accessModes:
    - ReadWriteMany
  hostPath:
    path: {{ $volume.hostPath }}
  storageClassName: pv-{{ $volume.nameSuffix | default $index }}
---
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: {{ template "basic-service.name" }}-pvc-{{ $volume.nameSuffix | default $index }}
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: pv-{{ $volume.nameSuffix | default $index }}
  resources:
    requests:
      storage: {{ $volume.storage | default "1Gi" }}
  {{- end -}}
{{- end -}}
