Feature: Update user info

  Background:
    * def responseSchema = read('classpath:users/schema/userAuth.json')
    * def bodyJson = Java.type('users.faker.DataGenerator').generateUpdateUser()

    Given url apiUrl
    And header Authorization = 'Token ' + token

  @debug
  Scenario:
    Given path 'user'
    And request bodyJson
    When method PUT
    Then status 200
    And assert responseTime < 1200
    And match response == responseSchema

