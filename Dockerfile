FROM golang:latest as builder

WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=386 go build -o api ./cmd/api/main.go
FROM scratch
COPY --from=builder /app/api /

CMD ["./api"]