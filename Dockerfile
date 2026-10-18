FROM node:24-bookworm-slim
WORKDIR /workspace
COPY package.json package-lock.json ./
RUN npm ci --cache /opt/npm-cache --no-audit --no-fund
COPY . .
CMD ["sh", "-c", "npm ci --offline --cache /opt/npm-cache --no-audit --no-fund && exec npm start -- --configuration docker"]
