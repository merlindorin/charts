{{/*
Expand the name of the chart.
*/}}
{{- define "concierge.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "concierge.fullname" -}}
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
{{- define "concierge.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "concierge.labels" -}}
helm.sh/chart: {{ include "concierge.chart" . }}
{{ include "concierge.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "concierge.selectorLabels" -}}
app.kubernetes.io/name: {{ include "concierge.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "concierge.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "concierge.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Api Service Name
*/}}
{{- define "concierge.apiServiceName" -}}
{{- printf "%s-api" (include "concierge.fullname" .) }}
{{- end }}

{{/*
Proxy Service Name
*/}}
{{- define "concierge.proxyServiceName" -}}
{{- printf "%s-proxy" (include "concierge.fullname" .) }}
{{- end }}

{{/*
Impersonate service account
*/}}
{{- define "concierge.impersonateServiceAccountName" -}}
{{- printf "%s-impersonation-proxy" (include "concierge.fullname" .) }}
{{- end }}

{{/*
servingCertificateSecretName
*/}}
{{- define "concierge.servingCertificateSecretName" -}}
{{- printf "%s-api-tls-serving-certificate" (include "concierge.fullname" .) }}
{{- end }}

{{/*
credentialIssuerName
*/}}
{{- define "concierge.credentialIssuerName" -}}
{{- printf "%s-config" (include "concierge.fullname" .) }}
{{- end }}

{{/*
impersonationLoadBalancerServiceName
*/}}
{{- define "concierge.impersonationLoadBalancerServiceName" -}}
{{- printf "%s-impersonation-proxy-load-balancer" (include "concierge.fullname" .) }}
{{- end }}

{{/*
impersonationClusterIPServiceName
*/}}
{{- define "concierge.impersonationClusterIPServiceName" -}}
{{- printf "%s-impersonation-proxy-cluster-ip" (include "concierge.fullname" .) }}
{{- end }}

{{/*
impersonationTLSCertificateSecretName
*/}}
{{- define "concierge.impersonationTLSCertificateSecretName" -}}
{{- printf "%s-impersonation-proxy-tls-serving-certificate" (include "concierge.fullname" .) }}
{{- end }}

{{/*
impersonationCACertificateSecretName
*/}}
{{- define "concierge.impersonationCACertificateSecretName" -}}
{{- printf "%s-impersonation-proxy-ca-certificate" (include "concierge.fullname" .) }}
{{- end }}

{{/*
impersonationSignerSecretName
*/}}
{{- define "concierge.impersonationSignerSecretName" -}}
{{- printf "%s-impersonation-proxy-signer-ca-certificate" (include "concierge.fullname" .) }}
{{- end }}

{{/*
agentPrefixName
*/}}
{{- define "concierge.agentPrefixName" -}}
{{- printf "%s-kube-cert-agent-" (include "concierge.fullname" .) }}
{{- end }}

{{/*
configMapVolume
*/}}
{{- define "concierge.configMapName" -}}
{{- printf "%s-config" (include "concierge.fullname" .) }}
{{- end }}

{{/*
impersonationProxyName
*/}}
{{- define "concierge.impersonationProxyName" -}}
{{- printf "%s-impersonation-proxy" (include "concierge.fullname" .) }}
{{- end }}

{{/*
kubeCertAgentName
*/}}
{{- define "concierge.kubeCertAgentName" -}}
{{- printf "%s-kube-cert-agent" (include "concierge.fullname" .) }}
{{- end }}

{{/*
aggregatedApiName
*/}}
{{- define "concierge.aggregatedApiName" -}}
{{- printf "%s-aggregated-api-server" (include "concierge.fullname" .) }}
{{- end }}
