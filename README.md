# RDispatch — a simple Ruby execution queue dispatcher

## Installation

Run `gem install rdispatch`

## Usage

1. Include RDispatch in your project: `require 'rdispatch'`
2. Write a method which handles arrays:
````
def task(arr)
	arr.each{|e|
		e**e
	}
````
3. Create RDispatch object: `rd = RDispatch.new`
4. Pass method and your data to RDispatch: `rd.create_task(method(:task), a)`
5. Run task: `rd.run!`

## License

This code is licensed under MIT License

## Probably-not-random-GIF

![](https://media.giphy.com/media/d2qJhxeaaWXPG/giphy.gif)