# -------- Build Stage --------
#FROM node:22-alpine AS build

#WORKDIR /app
#COPY . .

#RUN [ "npm", "install" ]
#RUN ["npm", "run", "build"]

# -------- Nginx Serve Stage --------
#FROM nginx:alpine

# COPY --from=build /app/build /usr/share/nginx/html
# COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]

FROM nginx:alpine

# 로컬에서 빌드한 파일만 복사
COPY ./build /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]