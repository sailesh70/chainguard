# Template for Nginx 1.26.3 Dockerfile
FROM nginx:1.27.4

# Default labels
{{- range $key, $value := .labels }}
LABEL {{ $key }}="{{ $value }}"
{{- end }}

# Default build arguments
{{- range $key, $value := .args }}
ARG {{ $key }}={{ $value }}
{{- end }}

# Set environment variables
{{- range $key, $value := .envs }}
ENV {{ $key }}="{{ $value }}"
{{- end }}

# Set working directory
WORKDIR /app

# Copy all files (not the directory) from build-output/*
COPY {{ .context }} .

# Ensure all copied files are executable
RUN chmod +x .

# Expose the application's port
EXPOSE {{ .port }}

# Run the application
CMD {{ .cmd }}
