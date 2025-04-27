# Use the official Elixir image
FROM elixir:1.18.3

# Set the working directory
WORKDIR /app

# Copy the project files
COPY . .

# Install dependencies
RUN mix local.hex --force && mix local.rebar --force
RUN mix deps.get

# Command to run the bot
CMD ["bash", "-c", "source .env && mix run --no-halt"]
