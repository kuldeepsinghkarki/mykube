FROM nginx:alpine
RUN echo "<h1>Hello kind World from $(hostname -f) </h1>" > /usr/share/nginx/html/index.html
EXPOSE 80
