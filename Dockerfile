# Используем Node.js образ
FROM node:18-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package.json yarn.lock ./

# Устанавливаем зависимости
RUN yarn install --frozen-lockfile

# Копируем остальные файлы проекта
COPY . .

# Собираем Next.js проект
RUN yarn build

# Указываем порт
EXPOSE 3000

# Запускаем сервер
CMD ["yarn", "start"]
