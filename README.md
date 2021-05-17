# PizzaBotPackage

With this app the user can write an input with this format `5x3(1,2)(2,3)` and the bot will find the route to each delivery point. This input is composed by the grid size (`5x3` in the example) and the coordinates `(1,2)(2,3)` to deliver the pizza. Once the user inputs the value, he will receive a result like this: `ENNDEND`, corresponding to the movements performed by the bot, where:

N = North, W = West, S = South, E = East, D = Drop Pizza

## Getting Started

Clone or download the project from the GIT repository.

Open macOS' Terminal and navigate to the folder where the project was cloned.

Type the command in the Terminal with this format: `swift run PizzaBotPackage "1x1(1,1)"`

The user will get an error in case the format is not correct or the coordinates are out of the grid bounds.

If the input has no error, the user will get a result with the route (i.e. for `swift run PizzaBotPackage "1x1(1,1)"` the result will be `END`)

### Prerequisites

This app works with MacOS 11.1 and above.

## Deployment

User will need a Mac with MacOS 11.1 or higher.

## Built With

XCode 12.4 (12D4e).

## Version

PizzaBot v1.0

## Authors

* **Ignacio Mariani**

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

