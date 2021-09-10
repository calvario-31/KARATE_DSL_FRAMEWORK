Feature: login feature

  Background:
    * def registerApi = callonce read('classpath:users/features/Register.feature')
    * def credentialsJson = read('classpath:users/json/credentials.json')
    * set credentialsJson.user.email = registerApi.bodyJson.user.email
    * set credentialsJson.user.password = registerApi.bodyJson.user.password

    * def responseSchema = read("classpath:users/schema/userAuth.json")

    Given url apiUrl

  Scenario: Login POST method
    Given path 'users', 'login'
    And request credentialsJson
    When method POST
    Then status 200
    And assert responseTime < 1200
    And match response == responseSchema