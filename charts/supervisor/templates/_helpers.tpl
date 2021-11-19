{{/*
Expand the name of the chart.
*/}}
{{- define "supervisor.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "supervisor.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "supervisor.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "supervisor.labels" -}}
helm.sh/chart: {{ include "supervisor.chart" . }}
{{ include "supervisor.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "supervisor.selectorLabels" -}}
app.kubernetes.io/name: {{ include "supervisor.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: supervisor
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "supervisor.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "supervisor.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Static Config name
*/}}
{{- define "supervisor.staticConfigName" -}}
{{- printf "%s-static-config" (include "supervisor.fullname" .) }}
{{- end }}

{{/*
Default Certificate Name
*/}}
{{- define "supervisor.defaultCertificateName" -}}
{{- printf "%s-default-tls-certificate" (include "supervisor.fullname" .) }}
{{- end }}