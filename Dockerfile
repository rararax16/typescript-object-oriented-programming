FROM amazonlinux:2 AS base
RUN yum update -y \
  && curl -sL https://rpm.nodesource.com/setup_16.x | bash \
  && yum install -y nodejs \
  && npm install -g yarn \
  && npm install -g typescript
FROM base
WORKDIR /myapp
COPY . .
RUN npm install \
  && npm run build
ENTRYPOINT ["npm", "run", "start"]