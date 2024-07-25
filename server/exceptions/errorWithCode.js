class ErrorWithCode extends Error {
  constructor(message, code, type = null) {
    super(message);
    this.statusCode = code;
    this.type = type;
  }
}

module.exports = ErrorWithCode;
