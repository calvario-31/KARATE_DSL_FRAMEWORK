Feature: Unfavorite Article
  Background:
    * def createArticleApi = callonce read('../CreateArticle.feature')
    * def slug = createArticleApi.slug

    * def responseSchema = read('../articleSchema.json')

    Given url apiUrl
    And header Authorization = 'Token ' +  token

  @regression
  Scenario:
    Given path 'articles', slug, 'favorite'
    When method DELETE
    Then status 200
    And assert responseTime < 1200
    And match response.article == responseSchema
    And assert response.article.favoritesCount == 0