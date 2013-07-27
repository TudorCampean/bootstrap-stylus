
'use strict';

module.exports = (grunt) ->

# Project configuration.
  grunt.initConfig
    jshint:
      all: [
        'js/*.js',
        'test/**/*.js']
      options:
        jshintrc: '.jshintrc'

    stylus:
      options:
        paths: [
          'styl/coreCSS'
          'styl/componentsCommon'
          'styl/componentsNav'
          'styl/componentsPopover'
          'styl/componentsMisc'
        ]
        "include css":true
        compress:false
      compile:
        files:
          'dist/css/bootstrap.css': ['styl/bootstrap.styl']
    cssmin: 
      minify: 
        expand: true
        cwd: 'dist/css/'
        src: ['*.css', '!*.min.css']
        dest: 'dist/css/'
        ext: '.min.css'
    # concat:
    #   dist: 
    #     src: ['js/*.js'],
    #     dest: 'dist/js/bootstrap.js',
    # uglify: 
    #   options: 
    #     banner: '/**\n* Bootstrap.js v3.0.0 by @fat & @mdo\n*'+
    #     ' Copyright 2013 Twitter, Inc.\n* http://www.apache.org/licenses/LICENSE-2.0.txt\n*/'
    #     report:'gzip'
    #   target: 
    #     files: 
    #       'dist/js/bootstrap.min.js': ['dist/js/bootstrap.js']
    connect:
      server:
        options:
          port: 3000
          base: '_gh_pages'
          keepalive:true
    # copy:
    #   files:
    #     expand: true
    #     src: ['dist/css/*.*']
    #     dest: '_gh_pages'
    #     filter: 'isFile'
    watch:
      options:
        dateFormat: (time) ->
          grunt.log.writeln "The watch finished in #{time} ms at #{(new Date()).toString()}"
          grunt.log.writeln 'Waiting for more changes...'
      scripts:
        files: 'styl/**/*.styl'
        tasks: 'css'

  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  #grunt.registerTask 'js', ['jshint','concat','uglify']
  grunt.registerTask 'css', ['stylus','cssmin']
  #grunt.registerTask 'default', ['stylus','cssmin','jshint','concat','uglify']
  grunt.registerTask 'default', ['stylus','cssmin']

