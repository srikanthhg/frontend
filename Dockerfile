FROM golang:1.21.3-alpine as builder

WORKDIR /app

COPY . .

RUN go build -o frontend

########################
FROM alpine:3.18.4

WORKDIR /app

COPY --from=builder /app/frontend /app/frontend

COPY ./templates ./templates

COPY ./static ./static

EXPOSE 8080

ENTRYPOINT ["/app/frontend"]
