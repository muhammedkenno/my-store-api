FROM node:20-slim

RUN apt-get update && apt-get install -y \
    libvips-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./

RUN npm install --include=optional && \
    npm install pg --save && \
    npm install @swc/core-linux-x64-gnu --save-optional && \
    npm install @rollup/rollup-linux-x64-gnu --save-optional && \
    npm install --os=linux --cpu=x64 sharp

COPY . .

RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "start"]