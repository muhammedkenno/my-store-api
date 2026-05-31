# Dockerfile
FROM node:20-alpine

WORKDIR /app

# ← ننسخ ملفات الـ package أولاً
COPY package*.json ./

# ← نثبت كل شيء بما فيها الـ optional
RUN npm install --include=optional

# ← ننسخ باقي الملفات
COPY . .

# ← نبني الـ admin panel
RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "start"]