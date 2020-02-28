/** Get Envinronment variable to choose Webpack config */
const NODE_ENV = process.env.NODE_ENV || 'development';

/** Require Webpack plugins */
const webpack = require('webpack');
const path = require('path');
const clean = require('clean-webpack-plugin');
const autoprefixer = require('autoprefixer');
const cssnano = require('cssnano');
const ExtractTextPlugin = require("extract-text-webpack-plugin");
const globImporter = require('node-sass-glob-importer');
const BrowserSyncPlugin = require('browser-sync-webpack-plugin');

const sass = require("node-sass");
const sassUtils = require("node-sass-utils")(sass);
const sassVars = NODE_ENV === 'development' ?
    require(__dirname + "/js/variables.js") :
    require(__dirname + "/js/variables-prod.js");

/** Objects to set different options for style-loader */
let stylesOptions, stylesOptionsExpanded;



/** Check current envinronment */
if (NODE_ENV === 'development') {

    /** Style-loader options with sourcemaps and autoprefixer */
    stylesOptions = {
        use: [

            /** css-loader tells Webpack that files are CSS */
            {
                loader: 'css-loader',
                options: {
                    url: false,
                    sourceMap: true
                }
            },

            /** postcss-loader add different plugins to transform css */
            {
                loader: 'postcss-loader',
                options: {
                    plugins: [
                        autoprefixer({
                            browsers: ['last 2 versions', 'ie 11']
                        })
                    ],
                    sourceMap: true
                }
            },

            /** sass-loader compile sass to css */
            {
                loader: 'sass-loader',
                options: {
                    functions: {
                        "get($keys)" : function(keys) {
                            keys = keys.getValue().split(".");
                            let result = sassVars;
                            let i;
                            for (i = 0; i < keys.length; i++) {
                                result = result[keys[i]];
                            }
                            result = sassUtils.castToSass(result);
                            return result;
                        }
                    },

                    sourceMapContents: true,
                    sourceMap: true,
                    outputStyle: 'expanded',
                    importer: globImporter()
                }
            }
        ]
    };

} else {

    /** Style-loader options without sourcemaps and minimize css-files */
    stylesOptions = {
        use: [

            /** css-loader tells Webpack that files are CSS */
            {
                loader: 'css-loader',
                options: {
                    url: false,
                    sourceMap: false
                }
            },

            /** postcss-loader add different plugins to transform css */
            {
                loader: 'postcss-loader',
                options: {
                    plugins: [
                        autoprefixer({
                            browsers: ['last 2 versions', 'ie 11']
                        }),
                        cssnano({
                            discardComments: {removeAll: false}
                        })
                    ],
                    sourceMap: false
                }
            },

            /** sass-loader compile sass to css */
            {
                loader: 'sass-loader',
                options: {
                    functions: {
                        "get($keys)" : function(keys) {
                            keys = keys.getValue().split(".");
                            let result = sassVars;
                            let i;
                            for (i = 0; i < keys.length; i++) {
                                result = result[keys[i]];
                            }
                            result = sassUtils.castToSass(result);
                            return result;
                        }
                    },

                    sourceMapContents: false,
                    sourceMap: false,
                    outputStyle: 'expanded',
                    importer: globImporter()
                },
            }
        ]
    };
}

/** Choose entry and output point of environment */

const entrtPoint =  [
    './js/index.js',
    './scss/style.scss'
];

const outputPoint = {
    path: path.resolve(__dirname, 'js/es5'),
    filename: 'bundle.js'
};

/** Webpack plugin that output style bundles to different paths */
let cssOutputPath = NODE_ENV === 'development' ? '/../../PAG-styles.css' : '/../../PAG-styles-prod.css';
const extractAllCss = new ExtractTextPlugin(cssOutputPath);

/** Set paths to cleaning files before building */
let cleanFilesPaths = [
    '/es5/bundle.js',
    'PAG-styles.css',
    'PAG-styles.css.map'
];

if (NODE_ENV !== 'development') {
    cleanFilesPaths.push('PAG-styles-prod.css');
    cleanFilesPaths = cleanFilesPaths.filter(el =>  el !== 'PAG-styles.css');
}


/**
 * Webpack Main Config
 * */
module.exports = {

    /** Entry Point to separate bundles  */
    entry: entrtPoint,

    /** Output bundles  */
    output: outputPoint,

    /** Enable Watch mode if current envinronment is Development  */
    watch: NODE_ENV === 'development',

    /** Decrease watch timepout (standart = 300)  */
    watchOptions: {
        aggregateTimeout: 100
    },

    stats: {
        entrypoints: false,
        children: false
    },

    /** Enable Sourcemaps if current envinronment is Development  */
    devtool: NODE_ENV === 'development' ? 'inline-source-map' : false,

    /** Wepback Loaders  */
    module: {
        rules: [
            {
                /** File mask  */
                test: /\.js$/,

                /** Execludes directories  */
                exclude: /(node_modules|bower_components)/,

                /** Loaders  */
                use: {

                    /** Babel-loader - compile ES6 to ES5  */
                    loader: 'babel-loader',
                    options: {
                        presets: [
                            ['@babel/preset-env', {
                                targets: {
                                    browsers: ['last 2 versions', '> 1%', 'ie 11']
                                },
                                modules: false
                            }]
                        ]
                    }
                }
            },
            {
                /** SASS loader to all scss|sass files */
                test: /\.(sass|scss)$/,
                exclude: /(node_modules|abovethefold)/,

                /** Use Webpack plugin that ouput transformed sass files with some options*/
                use: extractAllCss.extract(stylesOptions)
            }
        ]
    },

    /** Wepback Plugins  */
    plugins: [

        /** Cleand directories and files before webpack create bundles  */
        new clean(cleanFilesPaths),

        /** Add ability to use envinronment variable in js-code  */
        new webpack.DefinePlugin({
            NODE_ENV : JSON.stringify(NODE_ENV)
        }),

        /** Provide different ExtractTextPlugin  */
        extractAllCss,

        new BrowserSyncPlugin({
            // browse to http://localhost:3000/ during development,
            // ./public directory is being served
            host: 'localhost',
            port: 3000,
            server: {
                baseDir: "./",
                index: "index.html"
            },
            files: ['index.html', 'PAG-styles.css']
        })
    ]
};
