Feature: Update user info

  Background:
    * def responseSchema = read('classpath:users/schema/userAuth.json')
    * def loginApi = callonce read('classpath:users/features/Login.feature')
    * def token = loginApi.response.user.token
    * def bodyJson = Java.type('users.faker.DataGenerator').generateUpdateUser()

    Given url apiUrl
    And header Authorization = 'Token ' + token

  Scenario:
    Given path 'user'
    And request bodyJson
    When method PUT
    Then status 200
    And assert responseTime < 1200
    And match response == responseSchema

