module.exports = (grunt) ->
  getSettings = (cwd, src, dest, ext) ->
      {} =
        options:
          bare: yes
          force: yes
          sourceMap: no
        expand: yes
        cwd: cwd
        src: src
        dest: dest
        ext: ext
        
    grunt.initConfig
      pkg:
        grunt.file.readJSON 'package.json'
      less:
        res:
        	getSettings 'raw/styles/', '**/*.less', 'public/styles', '.css'
      coffee:
        res:
        	getSettings 'raw/scripts/', '**/*.coffee', 'public/scripts', '.js'
        ember:
        	getSettings 'raw/ember/', '**/*.coffee', 'ember', '.js'
      jade:
        res:
        	getSettings 'raw/templates/', '**/*.jade', 'public/templates', '.html'
      watch:
      	less:
          files: ['raw/styles/**/*.less']
          tasks: ['less']
        coffee:
          files: ['raw/scripts/**/*.coffee']
          tasks: ['coffee']
        jade:
          files: ['raw/templates/**/*.jade']
          tasks: ['jade']
  	
    grunt.loadNpmTasks 'grunt-contrib-less'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-jade'
    grunt.loadNpmTasks 'grunt-contrib-watch'

    grunt.registerTask 'default', ['less', 'coffee', 'jade']
    grunt