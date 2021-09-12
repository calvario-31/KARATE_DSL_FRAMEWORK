Feature: Update user info

  Background:
    * def bodyJson = Java.type('DataGenerator').generateUpdateUser()

    * def responseSchema = read('userAuthSchema.json')

    Given url apiUrl
    And header Authorization = 'Token ' + token

  @regression
  Scenario:
    Given path 'user'
    And request bodyJson
    When method PUT
    Then status 200
    And assert responseTime < 1200
    And match response == responseSchema

