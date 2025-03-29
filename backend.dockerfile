FROM node:18-slim

WORKDIR /home/chatbot

COPY src /home/chatbot/src
COPY tsconfig.json /home/chatbot/
COPY drizzle.config.ts /home/chatbot/
COPY package.json /home/chatbot/
COPY yarn.lock /home/chatbot/

RUN mkdir /home/chatbot/data
RUN mkdir /home/chatbot/uploads

RUN yarn install --frozen-lockfile --network-timeout 600000
RUN yarn build

CMD ["yarn", "start"]