Feature: Create article

  Background:
    * def bodyJson = Java.type('articles.faker.DataGenerator').generateNewArticle()
    * def responseSchema = read('classpath:articles/schema/article.json')

    Given url apiUrl
    And header Authorization = 'Token ' + token

  Scenario: Create an article POST method
    Given path 'articles'
    And request bodyJson
    When method POST
    Then status 200
    And assert responseTime < 1200
    And match response.article == responseSchema
    * def slug = response.article.slug