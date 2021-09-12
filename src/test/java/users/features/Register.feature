Feature: Register

  Background:
    * def bodyJson = Java.type("users.faker.DataGenerator").generateNewUser()
    * def responseSchema = read("classpath:users/schema/userAuth.json")

    Given url apiUrl

  @helpers
  Scenario: Register POST api
    Given path 'users'
    And request bodyJson
    When method POST
    Then status 200
    And assert responseTime < 1200
    And match response == responseSchema
    * def token = response.user.token

