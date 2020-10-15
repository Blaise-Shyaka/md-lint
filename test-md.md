## Test header title

Lorem lorem lorem lorem lorem     

  ## Installation

Lorem is written in ruby and is distributed as a rubygem. As long as Lorem is written in ruby and is distributdjdkhfalkdhfdfahdkfhkdhhkalfhlakhflsdkhfalfhakldfh rubygem. As long as
you have a relatively up to date ruby on your system, Lorem will be
simple to install and use. You have 2 options to install it:

 ### Hey
#### Hi
 ## Whatsup

To install from rubygems, run:

```shell
gem install lorem
```

To install the latest development version from github:

```shell
git clone https://github.com/lorem/lorem
cd lorem
rake install
```

Note that you will need [rake](https://github.com/ruby/rake)
(`gem install rake`) and [bundler](https://github.com/bundler/bundler)
(`gem install bundler`) in order to build from source.

## Usage

To have lorem check your markdown files, simply run `mdl` with the
filenames as a parameter:

```shell
mdl README.md
```

lorem can also take a directory, and it will scan all markdown files
within the directory (and nested directories):

```shell
mdl docs/
```

If you don't specify a filename, lorem will use stdin:

```shell
cat foo.md | lorem
```

lorem will output a list of issues it finds, and the line number where
the issue is. See [RULES.md](docs/RULES.md) for information on each issue, as
well as how to correct it:

```shell
README.md:1: MD013 Line length
README.md:70: MD029 Ordered list item prefix
README.md:71: MD029 Ordered list item prefix
README.md:72: MD029 Ordered list item prefix
README.md:73: MD029 Ordered list item prefix
```

lorem has many more options you can pass on the command line, run
`lorem --help` to see what they are, or see the documentation on
[configuring lorem](docs/configuration.md).

### Styles

Not everyone writes markdown in the same way, and there are multiple flavors
and styles, each of which are valid. While lorem's default settings
will result in markdown files that reflect the author's preferred markdown
authoring preferences, your project may have different guidelines.

It's not lorem's intention to dictate any one specific style, and in
order to support these differing styles and/or preferences, lorem
supports what are called 'style files'. A style file is a file describing
which rules lorem should enable, and also what settings to apply to
individual rules. For example, rule [MD013](docs/RULES.md#md013---line-length)
checks for long lines, and by default will report an issue for any line longer
than 80 characters. If your project has a different maximum line length limit,
or if you don't want to enforce a line limit at all, then this can be
configured in a style file.

For more information on creating style files, see the
[creating styles](docs/creating_styles.md) document.

## Related projects

- [lorem](https://github.com/DavidAnson/lorem) and
  [lorem-cli](https://github.com/igorshubovych/lorem-cli) for
  Node.js

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for more information.