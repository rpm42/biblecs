configure = ($routeProvider, $locationProvider) ->
  moment.lang('ru')

  $locationProvider
    .html5Mode(yes)

  $routeProvider
    .when "/",
      templateUrl: "books-view"
      controller: "BooksCtrl"
    .when "/:bookId",
      templateUrl: "chapters-view"
      controller: "ChaptersCtrl"
    .when "/:bookId/:chapter",
      templateUrl: "page-view"
      controller: "PageCtrl"

main = () ->

angular.module('app.ctrl', [
  "BooksCtrl"
  "ChaptersCtrl"
  "PageCtrl"
])

angular.module('app.div', [])

angular.module('app.svc', [
  "BooksSvc"
])

angular.module('app', [
    'ngSanitize'
    'ngRoute'
    'app.svc'
    'app.ctrl'
  ])
  .config([ '$routeProvider', '$locationProvider', configure ])
  .run([main])