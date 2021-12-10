## FrameNoob Blog

Great blog application to discuss everything about the most popular frameworks for Web App Development focusing on helping all those new entry programmers. Built with Ruby on Rails

## Built With

- Ruby (ruby 2.7.0p0)
- Rails 5.2.3

## Prerequisites

- Before we begin, make sure you have a fresh version of Ruby and PostgresSQL porperly installed.
- Please be sure that the cluster to the local server database is running with the next command:
`sudo pg_ctlcluster <Here your pg Version or the cluster you configured> main start` 

please note that if the cluster is stoped or doesn't exits the application will not run because it needs an online database.

## Getting Started

1. Clone this repository in your local. `git clone https://github.com/Felipeg005/FrameNoob-Blog`
2. Checkout the correct branch `git checkout <desired branch>`
3. Create the database of the project with this command `sudo -u postgres createdb framenoob_development`
4. Now with all installations ready please start the local server with the next code `rails s`

## Rspec Test

1. Please run `install bundle` to install all necessary gems before the test
2. You can run `rspec spec` or `rails spec` to test all files

## Author

👤 **Juan Felipe Gomez Tobon**

- GitHub: [@githubhandle](https://github.com/Felipeg005/)
- Twitter: [@twitterhandle](https://twitter.com/JuanFGT05)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/juan-felipe-gomez-tobon/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Thanks to Microverse for make it possible!
- <div>Iconos diseñados por <a href="https://www.flaticon.es/autores/justicon" title="justicon">justicon</a> from <a href="https://www.flaticon.es/" title="Flaticon">www.flaticon.es</a></div>

## 📝 License

This project is [MIT](./MIT.md) licensed.
