Feature: Get Article

  Background:
    * def createArticleApi = callonce read('CreateArticle.feature')
    * def slug = createArticleApi.slug

    * def responseSchema = read('classpath:articles/schema/article.json')

    Given url apiUrl
    And header Authorization = 'Token ' + token

  Scenario:
    Given path 'articles', slug
    When method GET
    Then status 200
    And assert responseTime < 1200
    And match response.article == responseSchema