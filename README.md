![](https://img.shields.io/badge/Microverse-blueviolet)

# Blog rails

The Blog rails app will be a classic example of a blog website. This will be a fully functional website that will show the list of posts and empower readers to interact with them by adding comments and liking posts.

## Built With

- Ruby on Rails

## Live Preview
### [Live Demo]()

## Additional Tools

- rubocop
- stylelint
- Ruby Gems

## Versions
- Ruby  ~3.1.2
- PostgreSQL  ~14.0
- Node.js  ~16.17.0
- Yarn  ~1.22.19

## `Getting Started`

To get a local copy of this project:

Clone this repository or download the Zip folder:
```
$ git clone git@github.com:AACHOURMOHAMED/blog-rails.git
```
Then:
```
$ cd blog-rails

$ gem install bundler

$ bundle install
```

To start App:
```
$ rails server
```

To view on browser:
```
http://localhost:3000
```

## `Database creation`

Create a Postgres user:
```
$ su - postgres
```

After that access Postgres:
```
psql
```

Then create a user (or a “role”, as Postgres calls it):
```
CREATE ROLE rubyonrails WITH CREATEDB LOGIN PASSWORD '1234';
```

Initialize the database:
```
$ bin/rails db:setup
```

Migrate the database:
```
$ bin/rails db:create
```

## `Tests`

### Running specs:
Default: Run all spec files (i.e., those matching spec/**/*_spec.rb):
```
$ bundle exec rspec
```
Run all spec files in a single directory (recursively):
```
$ bundle exec rspec spec/models
```
Run a single spec file:
```
$ bundle exec rspec spec/controllers/accounts_controller_spec.rb
```

Run a single example from a spec file (by line number):
```
$ bundle exec rspec spec/controllers/accounts_controller_spec.rb:8
```

See all options for running specs:
```
$ bundle exec rspec --help
```

### rails tests:

```
$ bin/rails test
```

### To track linter errors locally follow these steps:

Track Ruby linter errors run:
```
$ rubocop
```
To auto-correct correctable Rubocop offenses run:
```
$ rubocop --auto-correct-all | rubocop -A
```

## `Authors`

👤 **Aachour Mohamed**

- GitHub: [@AACHOURMOHAMED](https://github.com/AACHOURMOHAMED)
- LinkedIn: [LinkedIn]()

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/AACHOURMOHAMED/blog-rails/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- This project is part module 5 in the Microverse study program.
- Thanks to the Microverse team for the great curriculum.
- Thanks to Code Reviewers for the insightful feedback.
- A great thanks to My coding partners, morning session team, and standup team Partners for their contributions.

## 📝 License

This project is [MIT](./MIT.md) licensed.