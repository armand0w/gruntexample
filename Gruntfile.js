/**
 * npm install
 *
 * npm install -g grunt-cli
 *
 * npm install grunt-war --save-dev
 *
 * grunt
 */

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
        },
        war: {
            target: {
                options: {
                    war_dist_folder: 'build',    /* Folder where to generate the WAR. */
                    war_name: 'dn9soluciones'                    /* The name fo the WAR file (.war will be the extension) */
                },
                files: [
                    {
                        expand: true,
                        cwd: 'web',
                        src: ['**'],
                        dest: ''
                    }
                ]
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-connect');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-war');

    grunt.registerTask('default', ['connect', 'watch']);
};
