script.on_configuration_changed(function(event)
  for _,player in pairs(game.players) do
     player.force.reset_recipes()
     player.force.reset_technologies()
  end
end )
