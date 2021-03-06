---
title: "Space to Share"
date: 2021-02-09T14:24:18+01:00
Tags:
- Go
- Javascript
- Development
- Jamstack
---

Something I struggle with is perfectionism. To be clear, this is not a humble brag where I insinuate that everything I deliver is perfect. Far from it, it has been debilitating. I have deliberately refrained from submitting assignments that probably were good enough, but weren't in my own eyes causing me to fail classes. In fact, I have given up many assignments because I was sure they wouldn't be up to my standards before the deadline.

One way I hope to learn to detach myself from the things I make is by sharing more. Sharing ideas, works in progress, and finished products with strangers on the internet. To enable me to do this I decided I needed my own space to share, so here it is. I don't know yet what it will look like, or what technology I will be using. I will be sharing that as I decide, in this post.

> Note: I also needed a blog to share deliverables for school. So two birds with one stone, to use a morbid expression.

## Wants

So far I have stated why I want a personal site and blog: To show off works (in progress). But what do I want from my blog and site? This is important, because it will inform technical & design decisions later. First let's start with the sharing aspect.

- [ ] I want to publish written text as posts.
- [ ] I want to add images to posts.
- [ ] I want to allow others to leave feedback on posts.
- [ ] I want to organise posts using categories.
- [ ] I want to organise posts using tags.
- [ ] I want to organise posts temporally.

So far, pretty basic features covered by most blogging software available. But, I have a few more regarding posts:

- [ ] I want to write my posts in markdown.
- [ ] I want to add pretty code snippets to posts.
- [ ] I want to add interactive demos to posts.
 
 I really enjoy writing in markdown. The perfectionist in me likes to fret about how the text looks, changing font families and sizes to get the layout _just right_. Writing in Markdown frees me from these tendencies. Allowing me to focus on how it reads, not how it looks.
 
 A lot of the things I will be working on will involve code. To properly document my process I will need to be able to share code snippets. Preferably with pretty syntax and proper indentation. Additionally I think it would be cool to be able to include interactive demos.

- [ ] I want to link to my other spaces on the web.
- [ ] I want a pretty landing page.
- [ ] I want to offer a secure connection.
- [ ] I want my site to be blazing fast.

I also have some wishes for the site in general. I want to give users visiting the site a nice landing page that will direct them to my blogposts, or to my other spaces on the web. All while enjoying a fast, secure connection.

- [ ] I do not want it to cost me too much money.
- [ ] I want to use some unfamiliar technology.
- [ ] I want full control over markup and styling.
- [ ] I want to be able to extend the site.

For this project I would like to use at least one unfamiliar technology, so I may learn something new along the way. But I do want to be able to make the site entirely my own. Allowing me at least to override style and markup. Lastly I want to be able to extend and modify the site as requirements change.

## Discovery

The next phase is to determine what stack I want to use. There are a lot of options available, from building a static site with bare html and css (full control, a lot of effort) to using managed blog platforms like Medium (limited control, minimal effort).

To get a head start, one of my wishes was to write in Markdown. This throws out writing the HTML by hand. I'll need something that will take my markdown input and produces the HTML for me.  Fully dynamic applications like Wordpress and Drupal make the creation process of content easier. But we have to consider another wish: I want the site to be blazingly fast and nothing beats the raw speed of static files. To speed up dynamic applications I could cache content, but why not cache the pages as I add content to the site? I.e. using a static site generator.

Static site generators (SSG) offer the ability to generate and manage pages based on content without sacrificing response time speeds. They are also very light in resource usage on the server, as the server only needs to pass along files on request. You do sacrifice the ability to update content on the fly and see changes immediately. But I am comfortable performing a deployment each time I want to update content. As long it is not  on a Friday afternoon.

Narrowing the choice down to static site generators does not feel like narrowing anything down at all: Jamstack [lists over 300 generators](https://jamstack.org/generators/) on their site. I'll be considering the top 5 listings, sorted by GitHub stars.

> Jamstack does not refer to sandwich recipes that use jam -- like PB&J. Instead it is an application stack that primarily uses Javascript applications, populated with data coming from an API. A common among Jamstack technologies is to pre-render pages during build time to speed up delivery.

### Next.js

Next.js is from the people behind Vercel, which have put out amazing developer friendly tools and services.

Looking at the showcase it seems like Next.js is very versatile and can be used for all different kinds of purposes, not just blogging. 

It seems like pages are built using React components. Makes distinction between static props (fetched in at build time) and server side props (fetched at runtime). This allows you to mix static with dynamic content. Next.js leaves you completely free when it comes to which sources you use. Could easily [read markdown files](https://github.com/vercel/Next.js/tree/canary/examples/blog-starter) from the filesystem during build time.

It looks like Next.js has a lot of potential and leaves the developer free in their approach, as long as they use React. It also offers [support for Typescript](https://nextjs.org/docs/basic-features/typescript)! There seems to be a vibrant plugin ecosystem as well.

Next.js offers two methods for [pre-rendering pages](https://nextjs.org/learn/basics/data-fetching/two-forms): Server Side Rendering and Static Generation. Most of the other SSG's on this list just offer Static Generation, where the page is built once and served to each visitor. SSR however, pre-renders the page on request. To enable this Next.js is deployed as a Node.js server, but it has an option where it [exports Static HTML files](https://nextjs.org/docs/advanced-features/static-html-export). The pages just cannot use dynamic data. If deployed to [Vercel](https://vercel.com) the api and dynamic routes are handled by ServerLess functions (a technique I've been wanting to try out).

### Hugo

[Hugo](https://gohugo.io) is a static site generator written in Go and is apparently very fast. To build page layouts you use Go templating and page content is written in markdown. Themes are [available](https://themes.gohugo.io), and you can build your own or extend existing ones using templates. I have experience working with Go templates from working with [Helm](https://helm.sh). It seems to have good content management mechanisms and support for custom taxonomies. 

You can process (s)css and javascript files through pipes. Which could be used to do the interactive demos. It should be possible to use Typescript through Babel transpilation. But I would like to see if I can build a pipe on my own that uses `tsc`. Which would allow me to try my hand at Go development.

### Gatsby

[Gatsby](https://www.gatsbyjs.com) is another node.js powered SSG and like Next.js, pages are built using React. Unlike Next.js Gatsby just offers Static HTML generation. But it has an extremely vibrant eco system of plugins. Gatsby also supports Typescript out of the box.

An interesting thing that Gatsby does is that it combines all the data sources you provide in a single GraphQL api. Which allows you to access all sorts of data with a single query. There is also a plugin that adds support for MDX, which allows you to use React components inside Markdown files.

### Jeckyll

[Jeckyll](https://jekyllrb.com) has been a popular SSG for quite a while. One of its claims to fame is GitHub Pages, which has used it as a built in SSG. It is built with ruby and uses the [Liquid](https://jekyllrb.com/docs/liquid/) templating language. It also has processing support for (s)css and coffee script.

Personally I'm not looking for an excuse to work with Ruby. More of a personal preference more than anything. Otherwise Jeckyll seems like a mature product with a great ecosystem.

### Nuxt

[Nuxt.js](https://nuxtjs.org) is a SSG for [Vue.js](https://vuejs.org) web applications. It seems fully featured and offers the ability to generate static HTML files. But, like Next.js, it is deployed as a Node.js server by default.

I have absolutely no experience with Vue. Nuxt seems like the way to go to get a Vue application working quickly, but this is not the project I want to try Vue with.

## Picking a framework

Jeckyll and Nuxt both interest me the least. While Jeckyll is a mature and fully featured SSG for blogs, I don't want to get involved with Ruby again. As far as Nuxt goes, I'll remember it when I want to give Vue a try. So, they are out.

Next.js and Gatsby would allow me to build the site with React in Typescript. A combination I really enjoy working with. Both seem to be accompanied by great documentation and a vibrant plugin ecosystem. The distinctive features in my eyes are Gatsby's GraphQL interface for accessing data, and Next.js' integration with ServerLess functions (when deployed to Vercel).

Hugo really interests me since it uses Go to generate the sites and it seems like it can be used to build a blog quickly. Including important blog features like taxonomies, canonical links, and asset management.

Hugo seems like the way to go to set up a blog or site really quickly: Just organise content in a project directory, choose a theme, and within milliseconds it produces a static site. The possibility of writing Go modules for my site as a way to practice Go development also excites me.

### Short-list showdown

As of right now it is a showdown between Next.js, Gatsby, and Hugo. While Hugo promises a quick setup, I'm not afraid to get my hands dirty and set up a markdown blog using either Node.js project. So lets review my wishes from earlier. Which generator ticks every box?

| Wish | Gatsby | Hugo | Next |
| ---- | ------ | ---- | ---- |
| Posts |  🪛 | 🎁 | 🪛 |
| Posts have images | 🎁 | 🎁 | 🎁 |
| Comments | 🪚 | 🪚 | 🪚 |
| Categories | 🪛 | 🎁 | 🪛 |
| Tags | 🪛 | 🎁 | 🪛 |
| Timestamps | 🪛 | 🎁 | 🪛 |
| Markdown | 🎁 | 🎁 | 🪛 |
| Code snippets | 🪚 | 🎁 | 🪚 |
| Code demos | 🪛 | 🪛 | 🪛 |
| Links | 🎁 | 🎁 | 🎁 |
| Landing page | 🎁 | 🎁 | 🎁 |
| Secure Connection | 🪛 | 🪛 | 🪛 |
| Fast | 🎁 | 🎁 | 🎁 |
| Cheap | 🎁 | 🎁 | 🎁 |
| Markup/Styling | 🎁 | 🎁 | 🎁 |
| Extend site | 🎁 | 🪛 | 🎁 |


🎁 _Included out of the box_  
🪛 _Requires some work_  
🪚 _Requires a lot of work_

Looking at the table above it looks like Hugo will provide the most features out of the box. I expect that setting up a blog using Hugo will be a breeze. I also think this project is the most  appropriate for using Hugo, since it has such strong markdown support and content management. While I would really like to try out Next.js I have a different project in mind that would be better suited for it.

So there you have it. The blog you are reading right now, is built using Hugo.

## Getting started

To get this blog out of the door as quickly as possible I won't be concerning myself with the interaction and visual design. When I do I'll write about it in a follow-up, I promise. For now I picked a decent, minimalistic [theme](https://themes.gohugo.io/kiss/) from Hugo's theme directory.

For hosting I will be using a VPS I already have set up with Nginx and Let's Encrypt. Unlike the other projects already on the server I won't be running this site as a Docker container. It could well easily be done, but it seems rather unnecessary to forward traffic from one Nginx instance to another inside a container.

And that concludes how this site came to be.

