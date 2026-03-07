# Stage 1: Build the static site
FROM structurizr/cli:latest AS builder

USER root
WORKDIR /usr/local/structurizr

# Copy the workspace DSL
COPY workspace.dsl .

# Export to static site
RUN /opt/structurizr-cli/structurizr.sh export -workspace workspace.dsl -format static -output static

# Stage 2: Serve the static site using Nginx
FROM nginx:alpine

# Copy the generated static site from the builder stage
COPY --from=builder /usr/local/structurizr/static /usr/share/nginx/html

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
