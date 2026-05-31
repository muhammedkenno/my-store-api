# Dockerfile

# ← debian بدل alpine — يدعم gnu binaries
FROM node:20-slim

WORKDIR /app

COPY package*.json ./

# ← نثبت الـ GNU bindings صراحةً قبل أي شيء
RUN npm install --include=optional && \
    npm install @swc/core-linux-x64-gnu --save-optional && \
    npm install @rollup/rollup-linux-x64-gnu --save-optional

COPY . .

RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "start"]