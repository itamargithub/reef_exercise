FROM nginx:alpine

RUN echo "Hello World" > /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
