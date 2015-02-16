The task
------------------------------
- SinglePageApplication
- Testable
- Translatable
- [See Full Task specs](task.md)

Configuring proxy
------------------------------
You can use the env var (.env avaliable) PROXIES_LIST with comma separated value proxies list.

SetUp
------------------------------
```bash
  $ git clone https://github.com/zeopix/123ror.git 123ror
  $ cd 123ror
  $ bundle install
  $ rake bower:install #optional, assets bundled
  $ rails s
```
Run Tests
------------------------------
Jasmine tests using teaspoon (avaliable on browser too)
```bash
  $ rake teaspoon
```

Rspec tests:
```bash
  $ rspec spec/
```
