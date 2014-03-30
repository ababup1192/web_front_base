module.exports = (grunt)->
	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'
		# monitoring task
		watch:
			files: [
				'coffee/**/*.coffee',
				'jade/**/*.jade'
			],
			tasks: [
				'coffee',
				'jade'
			]
		# package manager
		bower:
			install:
				options:
					targetDir: './lib',
					layout: 'byType',
					install: true,
					verbose: false,
					cleanTargetDir: true,
					clearnBowerDir: false
		# html template engine
		jade:
			compile:
				options:
					pretty: true
				files: [
					cwd: "jade"
					src: "**/*.jade",
					dest: "build",
					expand: true,
					ext: ".html"
				]
		# js template engine
		coffee:
			compile:
				files: [
					expand: true
					cwd: 'coffee/'
					src: ['**/*.coffee']
					dest: 'js/'
					ext: '.js'
				]

	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-bower-task'
	grunt.loadNpmTasks 'grunt-contrib-jade'
	grunt.registerTask 'default', ['watch']
	return