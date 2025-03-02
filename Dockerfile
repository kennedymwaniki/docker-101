FROM node:23-alpine3.20

# Install pnpm
RUN npm install -g pnpm

WORKDIR /app

# Copy package files
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install

# Copy config files
COPY tsconfig.json ./

# Set and expose port
ARG PORT=8888
ENV PORT=${PORT}
EXPOSE ${PORT}

# Use development command with watch mode
CMD ["pnpm", "run", "dev"]

# docker build -t my-hono-app .
# run docker after building
# docker run --name hono-app -p 8888:8888 -v "${PWD}/src:/app/src" my-hono-app

