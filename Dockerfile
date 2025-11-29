# استخدام صورة Node.js الرسمية كأساس
FROM node:18-alpine

# تثبيت التبعيات الضرورية للنظام
RUN apk add --no-cache \
    ffmpeg \
    wget \
    ca-certificates \
    python3 \
    make \
    g++ \
    git

# إنشاء مجلد العمل
WORKDIR /app

# نسخ ملفات package.json و package-lock.json
COPY package*.json ./

# تثبيت التبعيات
RUN npm install --legacy-peer-deps

# نسخ جميع ملفات المشروع
COPY . .

# إنشاء المجلدات الضرورية
RUN mkdir -p session data

# منح الصلاحيات المناسبة
RUN chmod -R 755 /app

# تعيين متغيرات البيئة
ENV NODE_ENV=production
ENV TZ=Africa/Cairo

# فتح المنفذ (اختياري للبوت)
EXPOSE 3000

# أمر بدء التشغيل
CMD ["npm", "start"]
