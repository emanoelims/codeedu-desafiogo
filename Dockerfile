FROM golang AS builder

WORKDIR /app

COPY hello /app/ 
RUN go build -o hello
RUN chmod +x ./hello

FROM scratch

WORKDIR /app
COPY --from=builder /app/hello /app/hello
ENTRYPOINT [ "./hello" ]
