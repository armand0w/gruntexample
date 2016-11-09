
module.exports = function (grunt) {

    grunt.initConfig({
        connect: {
            server: {
                options: {
                    port: 8000,
                    base: 'web/'
                }
            }
        },
        watch: {
            project: {
                files: ['web/**/*.js', 'web/**/*.html', 'web/**/*.json', 'web/**/*.css'],
                options: {
                    livereload: true
                }
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-connect');
    grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.registerTask('default', ['connect', 'watch']);

};
