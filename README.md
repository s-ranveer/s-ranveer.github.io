# Ranveer Singh personal website

A static personal website generated with plain Ruby, ERB, and YAML. It has no Jekyll, framework, or gem dependencies.

## Build

```sh
ruby build.rb
```

The generated site is written to `public/`. Preview it locally with:

```sh
ruby -run -e httpd public -p 8080
```

Edit `src/data.yml` for content and `src/style.css` for the visual system. The HTML structure lives in `src/template.html.erb`.
