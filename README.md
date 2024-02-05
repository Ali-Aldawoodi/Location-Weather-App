# Location Weather App

User will be able to enter a city name and then get that cities current temperature, as well as a 7-day forecast of current temperatures as well as highs and lows. 


## Installation

Install rails as well as create new project.

```bash
  gem install rails
  rails new 'project-name'
```
    
## Gems

Install ActiveRecord and JSON.

```bash
  gem install "activerecord"
  gem install "json', '~> 2.7', '>= 2.7.1"
```
## API Reference

#### Get weather

```http
  GET "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m&daily=temperature_2m_max,temperature_2m_min&temperature_unit=fahrenheit&wind_speed_unit=mph&precipitation_unit=inch&timezone=America%2FDenver?
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
|    `name` | `string` | Retrieves city weather data|


#### Get city

```http
  GET "https://geocoding-api.open-meteo.com/v1/search?name=Berlin&count=1&language=en&format=json"
```

| Parameter                     | Type     | Description                |
| :--------                     | :------- | :------------------------- |
| `"latitude" & "longitude"'    | `string` | Retrieves city             |



## Deployment

To deploy this project run

```bash
  rails s
```
