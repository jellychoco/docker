FROM node:16-alpine

WORKDIR /app

COPY package.json package-lock.json ./

# npm install 하게되면 무조건 최신버전으로 다운받게 되는데, ci 를 사용하면 lock.json 에 해당하는 버전만 설치한다.
RUN  npm ci

COPY index.js .

ENTRYPOINT [ "node", "index.js" ]

# docker build -f Dockerfile -t fun-docker .
# -f 옵션은 도커파일 이름 지정 
# -t 는 태그같은 옵션
# . 은 도커파일 위치


# docker run -d -p 8080:8080 fun-docker
# -d : background 에서 동작해야하므로, detach 옵션
# -p : 포트 옵션

# docker logs [container ID] : logs checking

