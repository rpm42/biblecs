class BooksSvc

  constructor: (@$q, @$http) ->

  getBooks: () -> 
    deffered = @$q.defer()

    @$http.get('/data/books', cache: yes)
      .success (data, status, headers, config) =>
        deffered.resolve(data)
      .error (data, status, headers, config) => 
        deffered.reject()

    return deffered.promise

  getBook: (id) ->
    deffered = @$q.defer()

    @getBooks().then (books) =>
      if books[id] 
        deffered.resolve(books[id])
      else
        deffered.reject()
    , deffered.reject

    return deffered.promise

  getChapters: (bookId) ->
    deffered = @$q.defer()

    @$http.get('/data/chapters/'+bookId, cache: yes)
      .success (data, status, headers, config) => 
        deffered.resolve(data)
      .error (data, status, headers, config) => 
        deffered.reject()

    return deffered.promise

  getPage: (bookId, chapter) ->
    deffered = @$q.defer()

    @getChapters(bookId).then (chapters) =>
      if chapters[chapter] 
        deffered.resolve(chapters[chapter])
      else
        deffered.reject()
    , deffered.reject

    return deffered.promise


angular.module("BooksSvc", []).service("BooksSvc", ["$q", "$http", BooksSvc])