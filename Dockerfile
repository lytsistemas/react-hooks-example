# Etapa 1: Construcción de la aplicación
FROM node:20-alpine AS builder

WORKDIR /app

# Copiamos los archivos necesarios para instalar dependencias
COPY package.json package-lock.json ./

# Instalamos las dependencias
RUN npm install --frozen-lockfile

# Copiamos el código fuente y construimos la aplicación
COPY . .
RUN npm run build

# Etapa 2: Servidor de producción con Nginx
FROM nginx:1.25-alpine

# Copiamos los archivos de la build al directorio de Nginx
COPY --from=builder /app/build /usr/share/nginx/html

# Exponemos el puerto 80
EXPOSE 80

# Iniciamos Nginx
CMD ["nginx", "-g", "daemon off;"]

