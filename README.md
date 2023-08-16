# Associations Part 1 !

Building association with:
- has_one
- belongs_to
- has_many
- has_one_attached

<table>
  <tr>
    <td>Ruby version</td>
    <td>
      3.1.4
    </td>
  </tr>
  <tr>
    <td>Rails version</td>
    <td>
      7.0.4
    </td>
  </tr>
  <tr>
    <td>Database</td>
    <td>
      PostgreSQL
    </td>
  </tr>
<tr>
    <td>Front end</td>
    <td>
      Tailwind
    </td>
  </tr>
</table>

## Initial settings to run the project

```bash
# clone the project
git clone (https://github.com/daniel-neves-dev/associations_part_1.git)

# enter the cloned directory
cd associations_part_1

# install Ruby on Rails dependencies
bundle install

# install Node dependencies
yarn install
npm install

# create and built the database
rails db:drop

rails db:create db:migrate

rails db:seed

# tests validation
rspec

# run the project
bin/dev
```

Open the browser at the address `http://localhost:3000`

### The project was structured as follows:
## About the branches

```bash
main
# final version

release/0.1_crud (https://github.com/daniel-neves-dev/associations_part_1/compare/main...release/0.1_crud)
# build the CRUD files for books and authors

release/0.2_tests (https://github.com/daniel-neves-dev/associations_part_1/compare/main...release/0.2_tests)
# added the firsts spec tests

release/0.3_devise (https://github.com/daniel-neves-dev/associations_part_1/compare/main...release/0.3_devise)
# added devise for author account

release/0.4_devise_test (https://github.com/daniel-neves-dev/associations_part_1/compare/main...release/0.4_devise_test)
# updated spec tests dor devise

release/0.5_update (https://github.com/daniel-neves-dev/associations_part_1/compare/main...release/0.5_update)
# added image and description for books
# added avatar for authors

release/0.6_tailwind (https://github.com/daniel-neves-dev/associations_part_1/compare/main...release/0.6_tailwind)
#added basic front-end template 
```
