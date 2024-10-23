# FROM dart:3.3.0 AS build

# WORKDIR /app
# COPY . .

# RUN dart pub get
# RUN dart compile exe bin/main.dart -o bin/server

# FROM alpine:latest

# ENV runmode=production
# ENV serverid=default
# ENV logging=normal
# ENV role=monolith

# COPY --from=build /runtime/ /
# COPY --from=build /app/bin/server server
# COPY --from=build /app/confi[g]/ config/
# COPY --from=build /app/we[b]/ web/
# COPY --from=build /app/migration[s]/ migrations/


# EXPOSE 8080
# EXPOSE 8081
# EXPOSE 8082

# ENTRYPOINT ./server --mode=$runmode --server-id=$serverid --logging=$logging --role=$role

FROM dart:3.3.0 AS build

# Resolve app dependencies.
WORKDIR /app
COPY pubspec.* ./
COPY lib /app
COPY config /app
COPY bin /app

RUN dart pub get

# Copy app source code and AOT compile it.
COPY . .
# Ensure packages are still up-to-date if anything has changed
RUN dart pub get --offline

# Start server.
EXPOSE 8080
EXPOSE 8081
EXPOSE 8082
#CMD ["/app/bin/server"]
CMD /bin/bash -c "dart bin/main.dart --mode production --apply-migrations"