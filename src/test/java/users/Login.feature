Feature: login feature

  Background:
    * def credentialsJson = read('credentialsPayload.json')
    * set credentialsJson.user.email = credentials.email
    * set credentialsJson.user.password = credentials.password

    * def responseSchema = read("userAuthSchema.json")

    Given url apiUrl

  Scenario: Login POST method
    Given path 'users', 'login'
    And request credentialsJson
    When method POST
    Then status 200
    And assert responseTime < 1200
    And match response == responseSchema