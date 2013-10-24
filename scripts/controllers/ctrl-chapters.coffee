class ChaptersCtrl

  constructor: (@$scope, @$routeParams, @$booksSvc) ->
    @$scope.chapters = []
    @$scope.bookId = @$routeParams.bookId
    @$booksSvc.getBook(@$routeParams.bookId).then (book) =>
      for i in [1..book.chapters]
        @$scope.chapters.push(i)

angular.module("ChaptersCtrl",["BooksSvc"])
  .controller("ChaptersCtrl", ["$scope", "$routeParams", "BooksSvc", ChaptersCtrl])