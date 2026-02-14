{{/*
Create a default fully qualified app name.
*/}}
{{- define "flask-app.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}