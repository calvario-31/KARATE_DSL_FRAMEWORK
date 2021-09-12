Feature: Delete Article

  Background:
    * def createArticleApi = callonce read('CreateArticle.feature')
    * def slug = createArticleApi.slug

    Given url apiUrl
    And header Authorization = 'Token ' + token

  Scenario:
    Given path 'articles', slug
    When method DELETE
    Then status 200
    And assert responseTime < 1200