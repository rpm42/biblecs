class BooksCtrl

  constructor: (@$scope, @$booksSvc) ->
    @$booksSvc.getBooks().then (books) =>
      @$scope.books = books


angular.module("BooksCtrl", ["BooksSvc"])
  .controller("BooksCtrl",  ["$scope", "BooksSvc", BooksCtrl])