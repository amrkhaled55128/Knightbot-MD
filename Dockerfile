FROM node:20

RUN apt-get update && apt-get install -y \
    ffmpeg \
    wget \
    python3 \
    make \
    g++ \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./

RUN npm install --legacy-peer-deps

COPY . .

CMD ["npm", "start"]
