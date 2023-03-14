# Use latest stable channel SDK.
FROM dart:stable AS build
# Resolve app dependencies.
RUN mkdir /root/.ssh && chmod 0700 /root/.ssh
RUN ssh-keyscan github.com >> ~/.ssh/known_hosts
WORKDIR /app
COPY .env /app/.env
COPY .env ./
COPY pubspec.yaml /app/pubspec.yaml
COPY pubspec.* ./
RUN dart pub get

# Copy app source code (except anything in .dockerignore) and AOT compile app.
COPY . .
RUN dart compile kernel bin/server.dart -o bin/server.dill

FROM dart:stable

COPY --from=build /app/bin/server.dill /app/server.dill

WORKDIR /app
#CMD ["/app/bin/server"]
#ENTRYPOINT ["dart","run","server.dill"]
#EXPOSE 8080


