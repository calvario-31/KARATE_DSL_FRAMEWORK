Feature: Get user info
  Background:
    * def loginApi = callonce read('classpath:users/features/Login.feature')
    * def token = loginApi.response.user.token
    * def responseSchema = read('classpath:users/schema/userAuth.json')

    Given url apiUrl
    And header Authorization = 'Token ' + token


  Scenario: Get user GET method
    Given path 'user'
    When method GET
    Then status 200
    And assert responseTime < 1200
    And match response == responseSchema
