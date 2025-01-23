FROM node:16.20.2-slim
ARG ENV_FILE

WORKDIR /app

# Copy only the dependency files first
COPY front/package.json front/yarn.lock $ENV_FILE ./
RUN yarn install
# Copy the application files excluding unnecessary items (.dockerignore handles this)
COPY front/ ./
RUN cp $ENV_FILE .env

RUN yarn build

EXPOSE 9000

CMD [ "yarn", "start" ]
