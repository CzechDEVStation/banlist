Banlist = {}

-- Kontrola jestli je hráč na banlistu
AddEventHandler('playerConnecting', function(name, setCallback, deferrals)
  deferrals.defer()

  local source = source

  deferrals.update('Kontroluji jestli nejsi cheater...')

  Citizen.Wait(300)

  local Identifiers = GetPlayerIdentifiers(source)
  
  if not has_value(Banlist, Identifiers[1]) and not has_value(Banlist, Identifiers[2]) and not has_value(Banlist, Identifiers[3]) and not has_value(Banlist, Identifiers[4]) and not has_value(Banlist, Identifiers[5]) and not has_value(Banlist, Identifiers[6]) then

    deferrals.done()
  return
  else

  deferrals.done('Cheatery tu nemáme rádi.')
      CancelEvent()
  end
end)

-- Získá údaje z databáze
function Banlist()
  MySQL.Async.fetchAll('SELECT identifier1 FROM Banlist', {}, function(result)
    for i = 1, #result, 1 do
        table.insert(Banlist, tostring(result[i].identifier):lower())
    end
  end)

  MySQL.Async.fetchAll('SELECT identifier2 FROM Banlist', {}, function(result)
    for i = 1, #result, 1 do
        table.insert(Banlist, tostring(result[i].identifier):lower())
    end
  end)

  MySQL.Async.fetchAll('SELECT identifier3 FROM Banlist', {}, function(result)
    for i = 1, #result, 1 do
        table.insert(Banlist, tostring(result[i].identifier):lower())
    end
  end)

  MySQL.Async.fetchAll('SELECT identifier4 FROM Banlist', {}, function(result)
    for i = 1, #result, 1 do
        table.insert(Banlist, tostring(result[i].identifier):lower())
    end
  end)

  MySQL.Async.fetchAll('SELECT identifier5 FROM Banlist', {}, function(result)
    for i = 1, #result, 1 do
        table.insert(Banlist, tostring(result[i].identifier):lower())
    end
  end)

  MySQL.Async.fetchAll('SELECT identifier6 FROM Banlist', {}, function(result)
    for i = 1, #result, 1 do
        table.insert(Banlist, tostring(result[i].identifier):lower())
    end
  end)
end

-- Kontroluje jestli je v tabulce identifier
function has_value(tab, val)
  for index, value in ipairs(tab) do
      if value == val then
          return true
      end
  end
  
  return false
end

-- Při spojení s databází vyvolá funkci která získá údaje z databáze.
MySQL.ready(function()
  Banlist()
end)
