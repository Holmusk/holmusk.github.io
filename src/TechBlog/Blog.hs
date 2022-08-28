module TechBlog.Blog
       ( matchBlogPosts
       , createBlog
       , createTags
       , createMain
       , compilePosts
       ) where

import Hakyll (Compiler, Pattern, Rules, applyAsTemplate, buildTags, compile, constField, create,
               defaultContext, defaultHakyllReaderOptions, defaultHakyllWriterOptions, fromCapture,
               getResourceString, getTags, idRoute, itemBody, itemIdentifier, listField, loadAll,
               loadAndApplyTemplate, makeItem, match, pandocCompiler, recentFirst, relativizeUrls,
               renderPandocWith, route, setExtension, tagsRules)
import Text.Pandoc.Options (WriterOptions (..))
import Text.Pandoc (Template, compileTemplate)
import Text.Pandoc.Highlighting (Style, pygments, styleToCss)

import TechBlog.Context (pageCtx, postCtx, postCtxWithTags)
import TechBlog.Project (mkProjectCtx)


createMain :: Rules ()
createMain = do
    create ["index.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "blog/*"
            let ctx = listField "posts" postCtx (pure $ take 3 posts)
                    <> defaultContext
                    <> mkProjectCtx
                    <> constField "page" "Main"
            makeItem ""
                >>= applyAsTemplate ctx
                >>= loadAndApplyTemplate "templates/main.html" ctx
                >>= loadAndApplyTemplate "templates/default_with_banner.html" ctx
                >>= relativizeUrls
    create ["css/syntax.css"] $ do
        route idRoute
        compile . makeItem $ styleToCss codeStyle

-- | Creates each post page.
matchBlogPosts :: Rules ()
matchBlogPosts = match "blog/*" $ do
    route $ setExtension "html"
    compile $ do
        i <- getResourceString
        writerOptions <- initWriterOptions <$> compileTocTemplate
        pandoc <- renderPandocWith defaultHakyllReaderOptions writerOptions i
        let toc = itemBody pandoc
        tgs <- getTags (itemIdentifier i)
        let postTagsCtx = postCtxWithTags tgs
                       <> constField "toc" toc
                       <> pageCtx
        pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html" postTagsCtx
            >>= loadAndApplyTemplate "templates/default.html" postTagsCtx
            >>= relativizeUrls

-- | Creates "Blog" page with all tags.
createBlog :: Rules ()
createBlog = create ["blog.html"] $ compilePosts "Blog Posts" "blog/*"

createTags :: Rules ()
createTags = do
    tags <- buildTags "blog/*" (fromCapture "tags/*.html")
    tagsRules tags $ \tag ptrn -> do
        let title = "Tag " ++ tag
        compilePosts title ptrn

-- | Compiles all posts for the blog pages with the tags context
compilePosts :: String -> Pattern -> Rules ()
compilePosts title ptrn = do
    route idRoute
    compile $ do
        posts <- recentFirst =<< loadAll ptrn
        let ids = map itemIdentifier posts
        tagsList <- ordNub . concat <$> traverse getTags ids
        let ctx = postCtxWithTags tagsList
               <> listField "posts" postCtx (pure posts)
               <> defaultContext
               <> constField "page" title

        makeItem ""
            >>= loadAndApplyTemplate "templates/blog.html" ctx
            >>= loadAndApplyTemplate "templates/default.html" ctx
            >>= relativizeUrls

initWriterOptions :: Template Text -> WriterOptions
initWriterOptions template = defaultHakyllWriterOptions
    { writerTableOfContents = True
    , writerTOCDepth = 4
    , writerTemplate = Just template
    , writerHighlightStyle = Just codeStyle
    }

compileTocTemplate :: Compiler (Template Text)
compileTocTemplate =
    runIdentity $ either fail pure <$> compileTemplate "" "$toc$"

codeStyle :: Style
codeStyle = pygments
