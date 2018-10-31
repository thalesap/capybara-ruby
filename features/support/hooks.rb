After do |scenario|
  if scenario.failed?
    nome_cenario = scenario.name.tr(' ', '_').downcase!
    nome_cenario = nome_cenario.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, '')
    screenshot = "reports/shots/#{nome_cenario}.png"
    page.save_screenshot(screenshot)
    embed(screenshot, 'image/png', 'Clique para ver a imagem do erro')
  end
end

Before()do


  end


  