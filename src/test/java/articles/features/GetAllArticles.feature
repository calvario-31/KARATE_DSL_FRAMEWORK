Feature: Get all articles

  Background:
    * def responseSchema = read('classpath:articles/schema/article.json')

    Given url apiUrl

  Scenario: Get all articles GET method
    Given path 'articles'
    When method GET
    Then status 200
    And assert responseTime < 1200
    And match response.articles == "#[]"
    And match each response.articles == responseSchema
