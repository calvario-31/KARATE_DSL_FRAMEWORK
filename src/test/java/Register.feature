Feature: Register

  Background:
    * def bodyJson = Java.type("DataGenerator").generateNewUser()

    * def responseSchema = read("classpath:users/userAuthSchema.json")

    Given url apiUrl

  @smoke
  Scenario: Register POST api
    Given path 'users'
    And request bodyJson
    When method POST
    Then status 200
    And assert responseTime < 1200
    And match response == responseSchema
    * def token = response.user.token
    * def credentials = bodyJson.user

