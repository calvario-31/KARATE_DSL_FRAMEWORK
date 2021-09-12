Feature: Favorite Article
  Background:
    * def responseSchema = read('classpath:articles/schema/article.json')

    * def createArticleApi = callonce read('classpath:articles/features/CreateArticle.feature')
    * def slug = createArticleApi.slug

    Given url apiUrl
    And header Authorization = 'Token ' +  token

  Scenario:
    Given path 'articles', slug, 'favorite'
    When method POST
    Then status 200
    And assert responseTime < 1200
    And match response.article == responseSchema
    And assert response.article.favoritesCount == 1