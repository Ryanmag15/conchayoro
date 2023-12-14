# Dockerfile

# ---- Stage 1: Backend ----
FROM nginx:alpine as backend
COPY index.html /usr/share/nginx/html
EXPOSE 80

# ---- Stage 2: Frontend ----
FROM node:18 as frontend
# Adicione as instruções para construir sua imagem Next.js aqui

# ---- Stage 3: Final Image ----
FROM nginx:alpine

# Copia o conteúdo do Stage 1 (Backend)
COPY --from=backend /usr/share/nginx/html /usr/share/nginx/html
EXPOSE 80

# Copia o conteúdo do Stage 2 (Frontend)
# Substitua 'path/to/frontend' pelo caminho real do seu código-fonte do frontend
COPY --from=frontend /path/to/frontend /usr/share/nginx/html
