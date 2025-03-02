FROM node:23-alpine3.20

# Run directive
RUN npm install  -g pnpm

# set the default working location
WORKDIR /app

# copy individual files
COPY package.json  pnpm-lock.yaml ./

# Install dependencies using pnpm
RUN pnpm install

# Copy the rest of the application
COPY tsconfig.json ./
COPY src/ ./src/
COPY .env ./

# Document that the container listens on port 8888
# Use ARG for build-time variables
ARG PORT=8888
ENV PORT=${PORT}

EXPOSE ${PORT}


# Start the application
CMD ["pnpm", "run", "dev"]
#


# docker build -t my-hono-app .
# run docker after building
# docker run --name hono-app -p 8888:8888 -v "${PWD}/src:/app/src" my-hono-app