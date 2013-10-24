module.exports = (grunt) ->
  grunt.loadNpmTasks("grunt-contrib-coffee")
  grunt.loadNpmTasks("grunt-contrib-copy")
  grunt.loadNpmTasks("grunt-contrib-less")
  grunt.loadNpmTasks("grunt-contrib-concat")
  
  grunt.initConfig

    coffee:
      client:
        files:
          "temp/js/controllers/ctrl-books.js": "scripts/controllers/ctrl-books.coffee"
          "temp/js/controllers/ctrl-chapters.js": "scripts/controllers/ctrl-chapters.coffee"
          "temp/js/controllers/ctrl-page.js": "scripts/controllers/ctrl-page.coffee"
          "temp/js/services/svc-books.js": "scripts/services/svc-books.coffee"
          "temp/js/app.js": "scripts/app.coffee"


    less: 
      styles: 
        options:
          paths: [
            "styles/config"
            "styles/core"
          ]
        files:
          "temp/css/styles.css": "styles/pages/styles.less"



    concat:
      core:
        src: [
          "bower_components/jquery2/jquery.js"
          "bower_components/angular/angular.js"
          "bower_components/angular-route/angular-route.js"
          "bower_components/angular-sanitize/angular-sanitize.js"
          "bower_components/moment/min/moment.min.js"
          "bower_components/moment/min/langs.min.js"
        ]
        dest: "public/js/core.js"

      main:
        src: [
          "temp/js/services/svc-books.js"
          "temp/js/controllers/ctrl-books.js"
          "temp/js/controllers/ctrl-chapters.js"
          "temp/js/controllers/ctrl-page.js"
          "temp/js/app.js"
        ]
        dest: "public/js/app.js"

      styles:
        src: [
          "temp/css/styles.css"
        ]
        dest: "public/css/styles.css"


  grunt.registerTask "styles", ["less:styles", "concat:styles"]
  grunt.registerTask "core", ["concat:core"]
  grunt.registerTask "default", ["styles", "coffee:client", "concat:main"]
  grunt.registerTask "dist", ["styles", "coffee", "concat:dist", "cssmin", "uglify", "copy"]
