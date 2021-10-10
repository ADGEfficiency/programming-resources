https://www.gatsbyjs.com/docs/tutorial/part-2/

React component is a function that returns a single React element (that single element can have many child elements)

A React element is an object that React uses to render DOM elements.

simplest way to write React elements is with JSX = having HTML in your JavaScript files

```javascript
const Greeting = () => {
  return (
    <h1>Hello world!</h1>
  )
}
```

Two page element types in Hugo = Page versus ?

Three step create react component
1. import react
2. define component
3. export component

Make new pages by making new js files in `src/pages`

Reuse components = good

Use properties (props) to make components dynamic

Bit using layouts with children content, props etc

children = passed in at bottom of components

Using CSS modules - src/components/layout.module.css

use the className prop to apply classes to React components

1. write css in .module.css,
2. add classes to layout component (not page component - the layout!)
3. apply each class to the relevant element

## plugins - https://www.gatsbyjs.com/docs/tutorial/part-3/

1. npm install
2. gatsby-config.js
3. use by importing

skipped over

## graphql - https://www.gatsbyjs.com/docs/tutorial/part-4/

http://localhost:8000/___graphql

goal = 3 blog posts grouped by tag

need to review chapter 4 again - missed heaps (but it is working)

https://www.gatsbyjs.com/docs/how-to/routing/adding-markdown-pages/

https://www.gatsbyjs.com/docs/adding-tags-and-categories-to-blog-posts/

---
```
query {
  allMdx {
    group(field: frontmatter___tags) {
      edges {
        node {
          frontmatter {
            title
          }
        }
      }
      totalCount
      tag: fieldValue
    }
  }
}
```
