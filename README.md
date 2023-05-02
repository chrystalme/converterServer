# JSON to CSV Converter Server

This is a simple HTTP server written in Ruby that converts JSON data to CSV format.

## Setup

To run this server, you will need to have Ruby installed on your computer. You can download Ruby from the [official website](https://www.ruby-lang.org/en/downloads/).

Once you have ruby installed, you can install the required depencencies by runnning the following command in the project directory:

```bash
$ gem install webrick
```

## Usage

To start the server, run the following command:

```bash
$ ruby server.rb
```

This will start the server on **'localhost:8000'**

To convert a JSON file to a CSV, send a POST request to the /convert endpoint with the JSON data in the request body.

```bash
$ curl -X POST -H "Content-Type: application/json" -d '[{"name":"Alice","age":25,"email":"alice@example.com"}]' http://localhost:8000/convert
```

The server will return a CSV file in the response body.
```bash
name,age,email
Alice,25,alice@example.com
```

## Testing

To run the test suite, run the following command:

```bash
$ ruby test_suite.rb
```

## 📝 License

This project is [MIT](https://en.wikipedia.org/wiki/MIT_License) licensed
