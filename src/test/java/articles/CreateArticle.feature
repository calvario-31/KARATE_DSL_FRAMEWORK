Feature: Create article

  Background:
    * def bodyJson = Java.type('DataGenerator').generateNewArticle()
    * def responseSchema = read('this:articleSchema.json')

    Given url apiUrl
    And header Authorization = 'Token ' + token

  @regression
  @smoke
  Scenario: Create an article POST method
    Given path 'articles'
    And request bodyJson
    When method POST
    Then status 200
    And assert responseTime < 1200
    And match response.article == responseSchema
    * def slug = response.article.slug