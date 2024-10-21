# Build stage

# 베이스 이미지 설정
FROM node:lts-alpine as build-stage
# /app 디렉토리 생성
RUN mkdir -p /app
# 작업 디렉토리 설정
WORKDIR /app
# 의존성 설치
COPY package*.json ./
RUN npm install
# 애플리케이션 파일 추가
COPY . .
# 애플리케이션 빌드
RUN npm run build

# prod
# FROM nginx:stable-alpine as prodiction-stage
# COPY --from=build-stage /app/dist /usr/share/nginx/html

# 포트 설정
EXPOSE 1015

# 컨테이너 실행 시 실행할 명령 정의
CMD ["npm", "run", "dev"]