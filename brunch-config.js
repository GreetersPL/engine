exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: {
        'js/app.js': [
          /(web\/static\/js)/,
          '/bower_components/material-design-lite/material.js'
        ],
        'js/search.js': [
          'bower_components/angular/angular.js',
          'bower_components/angular-messages/angular-messages.js',
          'bower_components/angular-pickadate/dist/angular-pickadate.js',
          /(web\/static\/ng)/


        ]
      }

      // To use a separate vendor.js bundle, specify two files path
      // https://github.com/brunch/brunch/blob/stable/docs/config.md#files
      // joinTo: {
      //  'js/app.js': /^(web\/static\/js)/,
      //  'js/vendor.js': /^(web\/static\/vendor)/
      // }
      //
      // To change the order of concatenation of files, explictly mention here
      // https://github.com/brunch/brunch/tree/master/docs#concatenation
      // order: {
      //   before: [
      //     'web/static/vendor/js/jquery-2.1.1.js',
      //     'web/static/vendor/js/bootstrap.min.js'
      //   ]
      // }
    },
    stylesheets: {
      joinTo: 'css/app.css'
    },
    templates: {
      joinTo: 'js/app.js'
    }
  },

  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to '/web/static/assets'. Files in this directory
    // will be copied to `paths.public`, which is "priv/static" by default.
    assets: /^(web\/static\/assets)/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: ["deps/phoenix/web/static",
              "deps/phoenix_html/web/static",
              "web/static", "test/static"],

    // Where to compile files to
    public: "priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/^(web\/static\/vendor)/, "node_modules/**/*", 'bower_components/**/*']
    },
    sass: {
      options: {
        includePaths: ['bower_components']
      }
    }
  },

  modules: {
    autoRequire: {
      'js/app.js': ['web/static/js/app'],
      'js/search.js': ['web/static/ng/search']
    }
  },

  npm: {
    enabled: true
  }
};
