# 1. ベースイメージ
FROM node:18-alpine

# 2. 作業ディレクトリを作成
WORKDIR /app

# 3. 依存関係のコピーとインストール
COPY package.json package-lock.json* ./
RUN npm install

# 4. ソースコードのコピー
COPY . .

# 5. ビルド（本番用なら必須）
RUN npm run build

# 6. 本番サーバーとして起動（devなら npm run dev）
EXPOSE 3000
CMD ["npm", "start"]
