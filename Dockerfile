# Base image with Java (Clojure runs on JVM) - running debian
FROM openjdk:21-slim

# Install curl and dependencies
RUN apt-get update && apt-get install -y curl bash rlwrap git \
    && rm -rf /var/lib/apt/lists/*

# Install Clojure CLI
RUN curl -O https://download.clojure.org/install/linux-install-1.11.1.1429.sh \
    && chmod +x linux-install-1.11.1.1429.sh \
    && ./linux-install-1.11.1.1429.sh \
    && rm linux-install-1.11.1.1429.sh

# Set work directory inside container
WORKDIR /usr/src/app

# Copy your project files into container
COPY . .

# Download dependencies (avoids re-downloading on each run)
RUN clojure -P

# Run your app (adjust -M option depending on how you start it)
CMD ["clojure", "-X",  "core/run"]
