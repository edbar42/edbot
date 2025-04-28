defmodule Edbot.Helpers do
  def parse_crime_story(crimes) do
    fetched_crime = Enum.random(crimes)
    criminal = fetched_crime["title"]
    crime_reward = fetched_crime["reward_text"]

    if criminal == "" or crime_reward == "" or crime_reward == nil do
      parse_crime_story(crimes)
    else
      {criminal, crime_reward}
    end
  end
end
