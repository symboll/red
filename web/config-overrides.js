const { override, addWebpackModuleRule } = require('customize-cra') 
const postcssNormalize = require('postcss-normalize')
const getCSSModuleLocalIdent = require('react-dev-utils/getCSSModuleLocalIdent')
const getPublicUrlOrPath = require('react-dev-utils/getPublicUrlOrPath')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
const path = require('path')
const fs =require('fs')


const styluRegex = /\.styl$/;
const styluModuleRegex = /\.module\.styl$/;

const isEnvDevelopment =  process.env.NODE_ENV === 'development'
const isEnvProduction = process.env.NODE_ENV === 'production'
const shouldUseSourceMap = process.env.GENERATE_SOURCEMAP !== 'false'

const appDirectory = fs.realpathSync(process.cwd())
const resolveApp = relativePath => path.resolve(appDirectory, relativePath)


const publicUrlOrPath = getPublicUrlOrPath(
  process.env.NODE_ENV === 'development',
  require(resolveApp('package.json')).homepage,
  process.env.PUBLIC_URL
)

const getStyleLoaders = (cssOptions, preProcessor) => {
  const loaders = [
    isEnvDevelopment && require.resolve('style-loader'),
    isEnvProduction && {
      loader: MiniCssExtractPlugin.loader,
      // css is located in `static/css`, use '../../' to locate index.html folder
      // in production `paths.publicUrlOrPath` can be a relative path
      options: publicUrlOrPath.startsWith('.')
        ? { publicPath: '../../' }
        : {},
    },
    {
      loader: require.resolve('css-loader'),
      options: cssOptions,
    },
    {
      // Options for PostCSS as we reference these options twice
      // Adds vendor prefixing based on your specified browser support in
      // package.json
      loader: require.resolve('postcss-loader'),
      options: {
        // Necessary for external CSS imports to work
        // https://github.com/facebook/create-react-app/issues/2677
        ident: 'postcss',
        plugins: () => [
          require('postcss-flexbugs-fixes'),
          require('postcss-preset-env')({
            autoprefixer: {
              flexbox: 'no-2009',
            },
            stage: 3,
          }),
          // Adds PostCSS Normalize as the reset css with default options,
          // so that it honors browserslist config in package.json
          // which in turn let's users customize the target behavior as per their needs.
          postcssNormalize(),
        ],
        sourceMap: isEnvProduction ? shouldUseSourceMap : isEnvDevelopment,
      },
    },
  ].filter(Boolean);
  if (preProcessor) {
    loaders.push(
      {
        loader: require.resolve('resolve-url-loader'),
        options: {
          sourceMap: isEnvProduction ? shouldUseSourceMap : isEnvDevelopment,
          root: resolveApp('src'),
        },
      },
      {
        loader: require.resolve(preProcessor),
        options: {
          sourceMap: true,
        },
      }
    );
  }
  return loaders;
};

module.exports = override(
  addWebpackModuleRule({
    test: styluRegex,
    exclude: styluModuleRegex,
    use: getStyleLoaders(
      {
        importLoaders: 3,
        sourceMap: isEnvProduction
          ? shouldUseSourceMap
          : isEnvDevelopment,
      },
      'stylus-loader'
    ),
    // Don't consider CSS imports dead code even if the
    // containing package claims to have no side effects.
    // Remove this when webpack adds a warning or an error for this.
    // See https://github.com/webpack/webpack/issues/6571
    sideEffects: true,
  },
  // Adds support for CSS Modules, but using SASS
  // using the extension .module.scss or .module.sass
  {
    test: styluModuleRegex,
    use: getStyleLoaders(
      {
        importLoaders: 3,
        sourceMap: isEnvProduction
          ? shouldUseSourceMap
          : isEnvDevelopment,
        modules: {
          getLocalIdent: getCSSModuleLocalIdent,
        },
      },
      'stylus-loader'
    ),
  })
);