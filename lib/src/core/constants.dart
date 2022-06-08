class Constants {
  static const String baseUrl = "https://staging-api.astrotak.com/api/";
  static const String askQuestionDescription =
      """Seek accurate answers to your life problems and get
guidance towards the right path. Whether the
problem is related to love, self, life, business, money.
education or work, our astrologers will do an in depth
study of your birth chart to provide personalized
responses along with remedies.""";

  static const String jwtToken = """Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVHlwZSI6IkFHRU5UIiwidXVpZCI6ImIyYWViYjMwLThmM2YtMTFlYy05Y2I2LWY3ZTNmNjY2YTIyMyIsImlzRW1haWxWZXJpZmllZCI6dHJ1ZSwicGhvbmVOdW1iZXIiOiI5NzExMTgxMTk4IiwiZW1haWwiOiJyYWtlc2hzaGFybWEuamFpQGdtYWlsLmNvbSIsIm1hc2tlZEVtYWlsIjoicmFrKioqKioqKioqKioqKmdtYWlsLmNvbSIsImV4aXN0aW5nVXNlciI6ZmFsc2UsImlhdCI6MTY0Nzk0NTA0MSwiZXhwIjoxNjY3OTQ1MDQxfQ.Ng9sm0iJbY7_8BALAq31092He6gOIkmWUMw1dwzsg2E""";
}

enum Status { LOADING, COMPLETED, ERROR }

