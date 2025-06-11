# ---------- Build Stage ----------
# FROM openjdk:17-jdk-slim AS build
# WORKDIR /app

# COPY . .
# RUN chmod +x ./gradlew && ./gradlew build -x test

# ---------- Runtime Stage ----------
# FROM openjdk:17-jdk-slim AS runtime
# WORKDIR /app

# COPY --from=build /app/build/libs/iltuo-spring-app.jar /app/iltuo-spring-app.jar

# EXPOSE 4000
# CMD ["java", "-jar", "/app/iltuo-spring-app.jar"]

# ---------- Runtime Stage Only ----------
FROM openjdk:17-jdk-slim AS runtime
WORKDIR /app

# 로컬에서 빌드한 jar만 복사
COPY build/libs/iltuo-spring-app.jar /app/iltuo-spring-app.jar

EXPOSE 4000
CMD ["java", "-jar", "/app/iltuo-spring-app.jar"]
