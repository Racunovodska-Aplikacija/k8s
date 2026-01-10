{{- define "rac-app.name" -}}
{{ .Chart.Name }}
{{- end -}}

{{- define "rac-app.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}

{{- define "rac-app.labels" -}}
app.kubernetes.io/name: {{ include "rac-app.name" . }}
helm.sh/chart: {{ include "rac-app.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "rac-app.getSecret" -}}
{{- $secret := lookup "v1" "Secret" .context.Values.global.namespace .secretName }}
{{- if $secret }}
{{- index $secret.data .secretKey | b64dec }}
{{- end }}
{{- end -}}
