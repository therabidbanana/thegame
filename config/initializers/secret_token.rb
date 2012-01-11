# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Thegame::Application.config.secret_token = ENV['MONGOHQ_URL'] || 'eeacf49f6c72e8feb1fbbc09152cdf9612537421febbc635e7d26f62138600f3227d6fceb7bcdf88fbf2065cd437340ef86e0b4e72c20e8d900ea28ed47d239b'
