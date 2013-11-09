class PageCtrl

  constructor: (@$scope, @$routeParams, @$booksSvc) ->
    @$scope.bookId = @$routeParams.bookId
    @$scope.chapter = parseInt(@$routeParams.chapter, 10)
    @$booksSvc.getBook(@$routeParams.bookId).then (book) =>
      @$scope.name = book.name
      book.maxChapters = book.chapters
      @$booksSvc.getPage(@$scope.bookId, @$scope.chapter - 1).then (page) =>
        @$scope.verses = page.verses

angular.module("PageCtrl",["BooksSvc"])
  .controller("PageCtrl", ["$scope", "$routeParams", "BooksSvc", PageCtrl])